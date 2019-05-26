% state
% state(1) --> x co-ordinate
% state(2) --> y co-ordinate
% state(3) --> orientation of robot (pose)
% state(4) --> steering angle (steeringAngle)
% state(5) --> longitudinal velocity (vLongitudinal)

% control variables
% controlVariables(1) --> steeringAngleDesired
% controlVariables(2) --> vLongitudinalDesired


%% Function
function controller(state, controlVariables, propertyA4)

currentPath = propertyA4.pathProperty.currentPath.pathMatrix;

angleLimit = propertyA4.robotProperty.angleLimit;
DT = propertyA4.controllerProperty.DT;
T = propertyA4.controllerProperty.T;

if propertyA4.pathProperty.currentPath.pathType == 'cyclic'
    % find the nearest point. make a different path matrix with this
    % nearest point as the first element of path and the rest of elements
    % appended in the end.
    [~, nearestPointIndex] = min(hypot((currentPath(1, :) - state(1, 1)), (currentPath(2, :) - state(2, 1))));
    currentPath = [currentPath(:, nearestPointIndex:end), currentPath(:, 1:nearestPointIndex-1)];
    propertyA4.controllerProperty.goalX = currentPath(1, end);
    propertyA4.controllerProperty.goalY = currentPath(2, end);
end

data = zeros(1, 559);
captureDataCount = 1;

for t = 0:DT:T-DT
    
    if isGoalReached(state, propertyA4) == true
        % put control variables to zero or some value and then break the
        % loop.
%         controlVariables(:, 1) = 0;
        sprintf('Goal is reached.');
        break
    end
    
    dMin = min(sqrt((currentPath(1, :) - state(1, 1)).^2 + (currentPath(2, :) - ...
                                                    state(2, 1)).^2));

%     pathTrim = pathLocalize(path, startIndex, state, parameters);
    
    [controlVariables(1, 1), lookAheadDistanceCheck] = purePursuitController...
                            (state, currentPath, propertyA4);

    if ~lookAheadDistanceCheck
        sprintf('Robot out of bounds.');
        break
    end
    
    controlVariables(2, 1) = propertyA4.robotProperty.vLimit;
    
    if controlVariables(1) > angleLimit
       controlVariables(1) = angleLimit;
    end
    
    [state(:, 1), state(:, 2)] = bicycleRobot(state(:, 1), ...
                                        controlVariables, propertyA4);
    transform = transl2(state(1, 1), state(2, 1)) * trot2(state(3, 1));
    plotAgent(state, transform, propertyA4);
    
    
    data = captureData(data, dMin, captureDataCount);
    captureDataCount = captureDataCount + 1;
    
end

pathf = 'lane-change';
slip = parameters(4);
slipAngle1 = parameters(5);
slipAngle2 = parameters(6);
tauV = parameters(7);
tauG = parameters(8);
vLimit = parameters(12);
lookAheadDistance = parameters(19);
fileName = ['data ', pathf, ' ', num2str(angleLimit), ' ', num2str(vLimit), ' ', num2str(lookAheadDistance), ' ', num2str(tauV), ' ', num2str(tauG), ' ', num2str(slip), ...
                    ' ', num2str(slipAngle1), ...
                    ' ', num2str(slipAngle2), '.mat'];

save(fileName, 'data')
fileName = ['figure ', pathf, ' ', num2str(angleLimit), ' ', num2str(vLimit), ' ', num2str(lookAheadDistance), ' ', num2str(tauV), ' ', num2str(tauG), '.png'];
saveas(properties(2), fileName)

% delete robotPatch here so that if new robot patch has to be made, it
% is consistent.
end