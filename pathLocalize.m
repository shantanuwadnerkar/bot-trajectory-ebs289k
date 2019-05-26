function pathTrim = pathLocalize(path, startIndex, state, parameters)

lookAheadTime = parameters(20);
vLongitudinal = state(5);

pathDistance = vLongitudinal * lookAheadTime;
try
    pathSample = path(:, startIndex + 1) - path(:, startIndex);
catch
end

pathDistancePerIndex = sqrt(pathSample(1) .^ 2 + pathSample(2) .^ 2);

endIndex = startIndex + floor(pathDistance / pathDistancePerIndex);

if endIndex == startIndex
    endIndex = startIndex + 400; % do something else instead of hard-coding '400'
end

if endIndex >= length(path)
    endIndex = 0;
end

pathTrim = path(:, startIndex:endIndex);
end