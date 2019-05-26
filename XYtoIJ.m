function [i, j] = XYtoIJ(x, y, mapProperties)
% compute pixel map coordinates from World cartesian coordinates
%   Detailed explanation goes here
%   -------->x
%  |
%  |
%  |
%y v
% i=1 is bottom row (y=Ymax)
% j=1 is left column (x=0)

xMax = mapProperties.xMax; yMax = mapProperties.yMax; 

gridR = mapProperties.gridR;
gridC = mapProperties.gridC; 

i = floor((y./yMax) .* (gridR-1)) + 1;
j = floor((x./xMax) .* (gridC-1)) + 1;

end