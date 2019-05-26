function map = obstacleProperties(map, mapProperties)

x1 = 20; y1 = 30;
x2 = x1 + 5; y2 = y1 + 5;
map = updateMap(map, [x1, x2], [y1, y2], mapProperties);

x1 = 5; y1 = 5;
x2 = x1 + 5; y2 = y1 + 5;
map = updateMap(map, [x1, x2], [y1, y2], mapProperties);

end