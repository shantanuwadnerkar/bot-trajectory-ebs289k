function sameSideBoolean = isSameSide(R, C, N)
% return true if row on the same side. Returns false if the node is on the
% other side or is a start or end node.

Rside = floor(R / (N + 2));
Cside = floor(C / (N + 2));

if isStartEndNode(R, C, N) == true
    sameSideBoolean = false;
elseif Rside ~= Cside
    sameSideBoolean = false;
elseif Rside == Cside
    sameSideBoolean = true;
end
end