function [steeringAngleDesired, lookAheadDistanceCheck] = purePursuitController...
                                               (state, currentPath, propertyA4)

L = propertyA4.robotProperty.L;
lookAheadDistance = propertyA4.purePursuitControllerProperty.lookAheadDistance;
epsilonLookAhead = propertyA4.purePursuitControllerProperty.epsilonLookAhead;

pathDeviationXY = currentPath(1:2, :) - state(1:2, 1);

pathDeviationDistance = hypot(pathDeviationXY(1, :), pathDeviationXY(2, :));

[~, minPathDeviationDistanceIndex] = min(pathDeviationDistance);

% disp(abs(goalRangeDistance - lookAheadDistance) < epsilonLookAhead)

localGoalDistance = abs(pathDeviationDistance(1, minPathDeviationDistanceIndex:end) - lookAheadDistance); % only front. not in the back

goalIndex = find(localGoalDistance < epsilonLookAhead, 1, 'first' ); % find out dMin from path. use this dMinIndex to choose goalIndex only in the front and not back.

                    
if ~isempty(goalIndex)
    % keep doing normal shit
    localGoalXY = [currentPath(1:2, minPathDeviationDistanceIndex + goalIndex - 1); 1]
    lookAheadDistanceCheck = lookAheadDistance;
else
    % if empty, start reducing looAheadDistance
    try
        [~, minLocalGoalDistanceIndex] = min(localGoalDistance); % this distance can be in the front or in the back. S.find the current state in path index -> check localGoaldistaceRelative from that path onwards.
        localGoalIndex = minPathDeviationDistanceIndex + minLocalGoalDistanceIndex - 1;
        localGoalXY = [currentPath(1:2, localGoalIndex); 1]             % localGoalXY = [currentPath(1:2, localGoalIndex) - state(1:2, 1); 1]
        distanceCheck = hypot(localGoalXY(1, 1) - state(1, 1), localGoalXY(2, 1) - state(2, 1))
        sprintf("i'm runningggggggggggggggggggggggggggggggggggggg");
    catch
        % robot is lost beyond recovery
        lookAheadDistanceCheck = false;
    end
    
    if distanceCheck - lookAheadDistance <= 0
        lookAheadDistanceCheck = distanceCheck;
    else
        % robot is lost beyond recovery
        lookAheadDistanceCheck = false;
    end    
end
% disp(lookAheadDistanceCheck)
transform = transl2(state(1, 1), state(2, 1)) * trot2(state(3, 1));
localGoalXY_r = transform \ localGoalXY

errorY = localGoalXY_r(2, 1);
kappa = 2 * errorY / (lookAheadDistance ^ 2);
steeringAngleDesired = atan(kappa * L)
end