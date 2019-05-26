function [x, y] = IJtoXY(i, j, mapProperties)

xMax = mapProperties.xMax; yMax = mapProperties.yMax; 

gridR = mapProperties.gridR;
gridC = mapProperties.gridC; 
    

% compute World cartesian coordinates  from pixel map coordinates
x = xMax * (j-1)/(gridC-1);
y = yMax * (i-1)/(gridR-1);

end