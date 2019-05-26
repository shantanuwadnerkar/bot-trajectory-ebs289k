function startEndNodeBoolean = isStartEndNode(R, C, N)

startEndNodeBoolean = false;

% if (isDiagonalElement(R, C) == true) || (isLowerTriangleElement(R, C) == true)
%     startEndNodeBoolean = false;
% else
if (R == 1) || (R == 2*N+2)
    startEndNodeBoolean = true;
elseif (C == 1) || (C == 2*N+2)
    startEndNodeBoolean = true;
end
end