function controllerProperty = controllerProperty

goalX = 0; % 
goalY = 0; % 
goalPose = 0; % 
epsilonGoal = 0.4;
T = 10; % 
DT = 0.01; % s, Controller time step

controllerType = 'purePursuitController';
addpath(controllerType)


controllerProperty = struct;

%% Properties
controllerProperty.goalX = goalX;
controllerProperty.goalY = goalY;
controllerProperty.epsilonGoal = epsilonGoal;
controllerProperty.goalPose = deg2rad(goalPose);
controllerProperty.T = T;
controllerProperty.DT = DT;
controllerProperty.controllerType = controllerType;
end