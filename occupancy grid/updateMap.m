function map = updateMap(map, x, y, mapProperties)


[i(1), j(1)] = XYtoIJ(x(1), y(1), mapProperties);
[i(2), j(2)] = XYtoIJ(x(2), y(2), mapProperties);

map(i(1):i(2), j(1):j(2)) = 1;

end