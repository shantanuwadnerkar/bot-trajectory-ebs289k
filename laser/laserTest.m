clear
clc

addpath('geom2d\');

laserProperties = laserProperties; %#ok<ASGSL>
mapProperties = mapProperties; %#ok<ASGSL>
robotProperties = robotProperties; %#ok<ASGSL>
occupancyGrid = struct;

map = zeros(mapProperties.gridR, mapProperties.gridC);
occupancyGrid.occupancyGridOdds = ones(mapProperties.gridR, mapProperties.gridC);
occupancyGrid.occupancyGridProbabilities = 0.5 * ones(mapProperties.gridR, mapProperties.gridC);
map = obstacleProperties(map, mapProperties);

[map, occupancyGrid] = laserScan(map, occupancyGrid, mapProperties, laserProperties);


% number of sensors and their positions