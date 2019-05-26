N = 10;

dMAT = zeros(2*N+2);
nodeStartEnd = 0;
nodeInterior = 0;

% remove start and end nodes. iterate the below 2 for loops for interior
% nodes and find their costs. write separate code/function for start and
% end nodes.

% can optimize the below loops by only finding dmat for triangular matrix
% and then using the same values for another half.



for R = 1:2*N+2
    for C = 1:2*N+2
%         disp(R); disp(C);
        if isDiagonalElement(R, C) == true
            dMAT(R, C) = 1; % decide value
            continue
        end
        
        if isLowerTriangleElement(R, C) == true
            dMAT(R, C) = dMAT(C, R); % decide value
            continue
        end
        
        % cost when robot is trying to go from start or end node to other
        % nodes
        if isStartEndNode(R, C, N) == true
            dMAT(R, C) = 3; % decide value. don't know what value to set
            continue
        end
        
        if isSameRow(R, C, N) == true
            dMAT(R, C) = 4; % same row value
            continue
        end
        
        if isDiagonalManeuver(R, C, N) == true
            dMAT(R, C) = 5; % very high cost as this maneuver is not
            % possible
            continue
        end
        
        if isHeadlandManeuver(R, C, N) == true
            dMAT(R, C) = 6;
            % complicated
            continue
        end
    end    
end