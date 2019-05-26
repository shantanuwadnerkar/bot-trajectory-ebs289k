function path = pathFunction

%% Input
% Can be set as input parameters for the function 'pathFunction'.
circleCenter = [9 7];
circleAngle = 0:0.01:2*pi;
circleRadius = 5;

%% Processing
xCoordinate = circleCenter(1) + circleRadius * sin(circleAngle);
yCoordinate = circleCenter(2) - circleRadius * cos(circleAngle);
path = [xCoordinate; yCoordinate];
end