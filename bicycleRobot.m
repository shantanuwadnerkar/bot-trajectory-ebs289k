function [statePrime, state] = bicycleRobot(state, controlVariables, ...
                                                        propertyA4)

% state
% state(1) --> x co-ordinate
% state(2) --> y co-ordinate
% state(3) --> orientation of robot (pose)
% state(4) --> steering angle
% state(5) --> longitudinal velocity

% control variables
% controlVariables(1) --> steeringAngleDesired
% controlVariables(2) --> vLongitudinalDesired


% stateChange = dt * [
%     vLongitudinal * cos(pose) - vY * sin(pose);
%     vLongitudinal * sin(pose) - vY * cos(pose);
%     (vLongitudinal * tan(steeringAngle + slipAngle1) - vY) / L;
%     (-steeringAngle + steeringAngleDesired) / tauG
%     (-vLongitudinal + (1-s) * vLongitudinalDesired) / tauV;
%     ];

%% Initialization of Variables
dt = propertyA4.robotProperty.dt;
DT = propertyA4.controllerProperty.DT;
slip = propertyA4.robotProperty.slip;
slipAngle1 = propertyA4.robotProperty.slipAngle1;
slipAngle2 = propertyA4.robotProperty.slipAngle2;
tauG = propertyA4.robotProperty.tauG;
tauV = propertyA4.robotProperty.tauV;
L = propertyA4.robotProperty.L;
% angleLimit = propertyA4.robotProperty.angleLimit;
% vLimit = propertyA4.robotProperty.vLimit;

steeringAngleDesired = controlVariables(1);
vLongitudinalDesired = controlVariables(2);

vY = state(5) * tan(slipAngle2);
stateChange = zeros(5,1);

%% Euler Integration
for t = 0:dt:DT-dt
   
    stateChange(1:3,:) = dt * [
        state(5) * cos(state(3)) - vY * sin(state(3));
        state(5) * sin(state(3)) - vY * cos(state(3));
        (state(5) * tan(state(4) + slipAngle1) - vY) / L
        ];

    if tauG == 0
        stateChange(4) = steeringAngleDesired;
        state(4) = 0;
    else
        stateChange(4) = dt * (-state(4) + steeringAngleDesired)...
                                / tauG;
    end
    
    if tauV == 0
        stateChange(5) = vLongitudinalDesired;
        state(5) = 0;
    else
        stateChange(5) = dt * (-state(5) + (1-slip)...
                            * vLongitudinalDesired) / tauV;
                        
    end
    
%     if steeringAngleDesired > angleLimit
%         steeringAngleDesired = angleLimit;
%     end
    
    statePrime = state + stateChange;
end