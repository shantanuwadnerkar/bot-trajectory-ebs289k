function initializePath(propertyA4)

axesHandle = propertyA4.plotProperty.axesHandle;
currentPath = propertyA4.pathProperty.currentPath.pathMatrix;
xCoordinate = currentPath(1, :);
yCoordinate = currentPath(2, :);

if propertyA4.pathProperty.currentPath.pathName == 'circular path'
    patch(axesHandle, 'XData', xCoordinate, 'YData', yCoordinate, 'EdgeColor', 'black', ...
            'FaceColor', 'None')
elseif propertyA4.pathProperty.currentPath.pathName == 'lane change'
    plot(axesHandle, xCoordinate, yCoordinate, 'k');
end
end