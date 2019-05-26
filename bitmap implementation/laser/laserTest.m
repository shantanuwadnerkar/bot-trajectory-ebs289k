clear all;
clc

addpath('geom2d\');
laserProperties = laserProperties; %#ok<ASGSL>
mapProperties = mapProperties; %#ok<ASGSL>
robotProperties = robotProperties; %#ok<ASGSL>

map = zeros(mapProperties.gridR, mapProperties.gridC);
bitmap = 0.0 * ones(mapProperties.gridR, mapProperties.gridC);
map = obstacleProperties(map, mapProperties);

[map, bitmap] = laserScan(map, bitmap, mapProperties, laserProperties);


% number of sensors and their positions