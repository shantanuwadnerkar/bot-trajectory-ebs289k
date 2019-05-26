function pathProperty = pathProperty

pathProperty.currentPath = NaN;


pathProperty.circularPath.pathName = 'circular path';
pathProperty.circularPath.pathMatrix = pathFunction;
pathProperty.circularPath.pathType = 'cyclic';

pathProperty.laneChange.pathName = 'lane change';
pathProperty.laneChange.pathMatrix = pathFunction1;
pathProperty.laneChange.pathType = 'non-cyclic';
end