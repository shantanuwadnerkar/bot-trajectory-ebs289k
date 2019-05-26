function [figureHandle, axesHandle] = initializeFigure(propertyA4)

%% Initialize Variables
slip = propertyA4.robotProperty.slip;
slipAngle1 = propertyA4.robotProperty.slipAngle1;
slipAngle2 = propertyA4.robotProperty.slipAngle2;
tauG = propertyA4.robotProperty.tauG;
tauV = propertyA4.robotProperty.tauV;
angleLimit = propertyA4.robotProperty.angleLimit;
vLimit = propertyA4.robotProperty.vLimit;
lookAheadDistance = propertyA4.purePursuitControllerProperty.lookAheadDistance;


figureName = 'Animation';
figureHandle = figure('Name', figureName, 'NumberTitle', 'off');
axesHandle = axes('Parent', figureHandle);

grid on

% Add attributes to figure
title({'lane-change'; ['angleLimit: ', num2str(angleLimit), ', vLimit: ', ...
                    num2str(vLimit), ', lookAheadDistance: ', ...
                    num2str(lookAheadDistance)]; ['tauV ', ...
                    num2str(tauV), ...
                    ', tauG ', num2str(tauG), ', slip: ', num2str(slip), ...
                    ', slipAngle1: ', num2str(slipAngle1), ...
                    ', slipAngle2: ', num2str(slipAngle2)]});
    
hold on

% ['rowCenterDistance: ', num2str(rowCenterDistance)]; ['dt: ', ...
%     num2str(dt), ', DT: ', num2str(DT),  ', slip: ', ...
%     num2str(slip), ', slipAngle1: ', num2str(rad2deg(slipAngle1)), ...
%     ', slipAngle2: ', num2str(rad2deg(slipAngle2)), ', tauG: ', num2str(tauG), ...
%     ', tauV: ', num2str(tauV)]});

set(0, 'currentfigure', figureHandle);

% X & Y axes limit
xlim([-5, 20]);
ylim([-5, 20]);
axis equal
end