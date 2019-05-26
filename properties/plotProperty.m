% xLim, yLim can be added here.

function plotProperty = plotProperty(propertyA4)
% Getting the dimension matrix of tractor. Returns co-ordinates of all the
% points which constitute the tractor.
[plotProperty.figureHandle, plotProperty.axesHandle] = initializeFigure(propertyA4);

% Plotting/Graphing all the changes. While plotting, 'Parent' is assigned 
% as the above 'robotAgent' so the graphics can be transformed when
% transformation matrix of the robot is changed. This is how changes in
% motion of tractor are animated in the graph.
% Creates a transformation object which can be translated, rotated or
% scaled. This robot has property robot.Matrix which achieves this.
plotProperty.robotAgent = hgtransform('Parent', plotProperty.axesHandle);

plotProperty.robotPatch = NaN;

% The below line only initialises the tractor. Further changes are done,
% while in the controller loop.
plotProperty.robotDimension = dimensionAgent; % 2x5 dimension matrix

end