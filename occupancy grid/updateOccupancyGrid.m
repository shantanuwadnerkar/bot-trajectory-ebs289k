function occupancyGrid = updateOccupancyGrid(occupancyGrid, IJ, val)

% occupancyGridOdds = occupancyGrid.occupancyGridOdds; %#ok<ASGSL>

occupancyGrid.occupancyGridOdds(IJ(1), IJ(2)) = val;

end