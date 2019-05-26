function sameRowBoolean = isSameRow(R, C, N)

if isStartEndNode(R, C, N) == true
    sameRowBoolean = false;
elseif abs(R - C) == N
    sameRowBoolean = true;
else
    sameRowBoolean = false;
end
end