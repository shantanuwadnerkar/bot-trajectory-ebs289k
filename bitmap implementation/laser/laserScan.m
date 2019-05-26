function [map, bitmap] = laserScan(map, bitmap, ...
                                        mapProperties, laserProperties)

% Don't need laserSpan for many things right now. Can be used to plot a
% graph of lidar distance (m) v/s span angle (rad/deg).

laserProperties = laserProperties; %#ok<ASGSL>
mapProperties = mapProperties; %#ok<ASGSL>

rangeMax = laserProperties.rangeMax;
angleSpan = laserProperties.angleSpan;
angleStep = laserProperties.angleStep;
transformLaser = laserProperties.transformLaser; % take out. put it in laserMain loop for multiple lasers.

xMax = mapProperties.xMax; yMax = mapProperties.yMax; 


laserSpan = zeros(round(angleSpan/angleStep + 1), 2);
laserBeamCount = 1; % ?????

laserX_l = 0; laserY_l = 0;

% transform laser origin to world frame
laserXY = transformLaser * [laserX_l laserY_l 1]';

% find the corresponding pixel
[laserIJ(1), laserIJ(2)] = XYtoIJ(laserXY(1), laserXY(2), mapProperties);

bitmap = updateBitmap(bitmap, laserIJ, 2);

% sweep laser span to find objects
for angle = - angleSpan/2 : angleStep: angleSpan/2
    
    laserSpan(laserBeamCount,1) = angle; % the angle
    
    % first produce target point for laser in scanner frame
    laserDepthX_l = rangeMax * cos(angle);
    laserDepthY_l = rangeMax * sin(angle);
    
    % transform target point in world frame
    laserDepthXY = transformLaser * [laserDepthX_l laserDepthY_l 1]';
    
    dx = laserDepthXY(1) - laserXY(1); dy = laserDepthXY(2) - laserXY(2);

    % ATTENTION: if dy or dx is close to 0 but negative, make it almost zero
    % positive
    if (abs(dx)) < 1E-6
        dx = 1E-6;
    end

    if (abs(dy)) < 1E-6
        dy = 1E-6;
    end
    
    % clip line to world boundary polygon
    edge = clipLine([laserXY(1), laserXY(2), dx, dy], [0 xMax 0 yMax]);
    
    % assume laser origin is always inside map
    laserDepthXY(1) = edge(3); laserDepthXY(2) = edge(4);
    
    % now compute if ray intersects an obstacle in the map
    % first map world points to integer coordninates; row I: 1...R, 
	% column J: 1..C
    
    [laserDepthIJ(1), laserDepthIJ(2)] = XYtoIJ(laserDepthXY(1), laserDepthXY(2), mapProperties);
    
    % call laser range function from rvctools/common
    % returns obstacle pixel; if no obstacle returns inf
    obstacleIJ = bresenhamFastUpdated([laserIJ(1) laserIJ(2)], [laserDepthIJ(1) laserDepthIJ(2)], map);
    
    if (isinf(obstacleIJ(1)) || isinf(obstacleIJ(2)))
        laserSpan(laserBeamCount, 2) = -1; % arbitrarily assign -1. Euclidean distance cannot be negative
    else
        % compute target point (that gave reflection) in world coordinates
        [obstacleXY(1), obstacleXY(2)] = IJtoXY(obstacleIJ(1), obstacleIJ(2), mapProperties);
        
        % compute distance from laser origin to target point
        laserSpan(laserBeamCount, 2) = hypot(laserXY(1) - obstacleXY(1), laserXY(2) - obstacleXY(2));
        
        if laserSpan(laserBeamCount, 2) <= rangeMax
            % change bitmap
            bitmap = updateBitmap(bitmap, obstacleIJ, 1);
        end
        
    end
    
    laserBeamCount = laserBeamCount + 1; % shoot next laser beam    
end
end