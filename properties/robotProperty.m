function robotProperty = robotProperty

% transofrmation matrix can be added here

dt = 0.01; % s, Euler intergration time step

slip = 0; %
slipAngle1 = 0; % deg, Slip of front wheels
slipAngle2 = 0; % deg, Slip of rear wheels
tauG = 0; % s, Time response of steering angle (gamma)
tauV = 0; % s, Time response of velocity
L = 2.5; % m, Wheelbase
rW = 0.5; % m, Radius of wheel
angleLimit = 45; % deg, Steering angle limit of tractor
vLimit = 5; % m/s, Velocity limit of tractor
epsilonDistance = 0.1; % m
epsilonAngle = 0.1; % deg
epsilonSpeed = 0.01; % m/s


robotProperty = struct;

%% Properties
robotProperty.dt = dt;

robotProperty.slip = slip;
robotProperty.slipAngle1 = deg2rad(slipAngle1);
robotProperty.slipAngle2 = deg2rad(slipAngle2);
robotProperty.tauG = tauG;
robotProperty.tauV = tauV;
robotProperty.L = L;
robotProperty.rW = rW;
robotProperty.angleLimit = deg2rad(angleLimit);
robotProperty.vLimit = vLimit;
robotProperty.epsilonDistance = epsilonDistance;
robotProperty.epsilonAngle = epsilonAngle;
robotProperty.epsilonSpeed = epsilonSpeed;
end