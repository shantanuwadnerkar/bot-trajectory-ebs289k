function diagonalBoolean = isDiagonalManeuver(R, C, N)

% diagonalBoolean = false;

if (isSameRow(R, C, N) == true) || (isStartEndNode(R, C, N) == true)
    diagonalBoolean = false;
elseif isSameSide(R, C, N) == false
    diagonalBoolean = true;
else
    diagonalBoolean = false;
end
end