function path = pathFunction1

%% Processing
xCoordinate = [0:0.01:10, 10 * ones(1, 501), 10:0.01:20];
yCoordinate = [zeros(1, 1001), 0:0.01: 5, 5 * ones(1, 1001)];

path = [xCoordinate; yCoordinate];
end