function plotAgent(state, T, propertyA4)

robotAgent = propertyA4.plotProperty.robotAgent;
figureHandle = propertyA4.plotProperty.figureHandle;
axesHandle = propertyA4.plotProperty.axesHandle;
robotDimension = propertyA4.plotProperty.robotDimension;

if ~isempty(propertyA4.plotProperty.robotPatch)
    propertyA4.plotProperty.robotPatch = patch(axesHandle, 'XData', robotDimension(1, :), 'YData', ...
            robotDimension(2, :), 'FaceColor', 'blue', ...
                'Parent', robotAgent);
end



% Input the object and new transformation matrix, the tractor will be 
% updated to the new location.

% Property object.Matrix requires a 4x4 dimension matrix whereas we have a
% 3x3 matrix. so converting a 3x3 homogeneous matrix to 4x4 homogenous
% matrix.



[~, c] = size(state);
if c == 1
    state = [state, state];
end

T = [
    T(1,1), T(1,2), 0, T(1, 3);
    T(2,1), T(2,2), 0, T(2, 3);
    0 0 1 0;
    0 0 0 1
    ];

% Assigning the object, new transformation matrix.
robotAgent.Matrix = T;

set(0, 'currentfigure', figureHandle);
patch(axesHandle, 'XData', [state(1, 2), state(1, 1)], 'YData', ...
                [state(2, 2), state(2, 1)], 'EdgeColor', 'green')

drawnow


end