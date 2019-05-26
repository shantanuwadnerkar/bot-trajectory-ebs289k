function spawnTractor = dimensionAgent % (spawnLocation)
% Returns co-ordinates of pentagon representing a tractor. Input is the
% location to spawn the tractor.

% Dimensions of the tractor. Point 1-2-3-4-5-1. Plots a pentagon.
agentDimensions = [
    0, 0, 1;
    -0.25, 0.25, 0
    ];

% Spawn location (y co-ordinate) of tractor.
spawnTractor(1, :) = agentDimensions(1, :); % + spawnLocation(1, :);

% Spawn location (y co-ordinate) of tractor.
spawnTractor(2, :) = agentDimensions(2, :); % + spawnLocation(2, :);
end