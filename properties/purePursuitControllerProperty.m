function purePursuitControllerProperty = purePursuitControllerProperty


lookAheadDistance = 3;
lookAheadTime = 0.6;
epsilonLookAhead = 0.1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% circle:
% pathLocalize --> 150;
% lookAheadDistance = 2; lookAheadTime = 0.01;
% lookAheadDistance = 4; lookAheadTime = 0.01;
% lane-change:
% pathLocalize --> 400;
% lookAheadDistance = 1; lookAheadTime = 0.6;
% lookAheadDistance = 2; lookAheadTime = 0.5; use 0.2 for vLimit = 10;
% lookAheadDistance = 3; lookAheadTime = 0.3; use 0.2 for vLimit = 10;
%       for tauG = 0.15 and tauV = 0.5, use 0.6
%       for tauG = 0.3 and tauV = 0.5, use 0.6
%       for angleLimit = 35, tauG = 0.15 and tauV = 0.5, use 0.6
%       for angleLimit = 35, tauG = 0.3 and tauV = 0.5, use 1
% lookAheadDistance = 4; lookAheadTime = 0.2;

% talk about dataStorage lines comment/uncomment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

purePursuitControllerProperty = struct;

purePursuitControllerProperty.lookAheadDistance = lookAheadDistance;
purePursuitControllerProperty.lookAheadTime = lookAheadTime;
purePursuitControllerProperty.epsilonLookAhead = epsilonLookAhead;

end