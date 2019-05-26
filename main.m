clear;
clc;

userInput = input('For circular path , press c, and for lane-change, press l: ', 's');

%% Import Properties
propertyA4 = propertyA4; %#ok<ASGSL>


%% User Input
if userInput == 'c' || userInput == 'C'
    propertyA4.pathProperty.currentPath = propertyA4.pathProperty.circularPath;
    
    initialX = 15; initialY = 5; initialPose = 90; steeringAngle = 0;
    vLongitudinal = 0;

elseif userInput == 'l' || userInput == 'L'
    propertyA4.pathProperty.currentPath = propertyA4.pathProperty.laneChange;
    
    initialX = 0; initialY = 0; initialPose = 0; steeringAngle = 0;
    vLongitudinal = 0;

else
    sprintf("Invalid input.")
end


%% Internal Processing
initialPose = deg2rad(initialPose); % rad, converting degrees to radians
steeringAngle = deg2rad(steeringAngle); % rad, converting deg to radians

state = [initialX; initialY; initialPose; steeringAngle; vLongitudinal];

controlVariables = zeros(2, 1);



%% Initialize Path
initializePath(propertyA4);



%% Initialize Plot

% Transformation matrix for the initial pose.
transform = transl2(initialX, initialY) * trot2(initialPose);

% Assigning this transformation matrix to the object.
plotAgent(state, transform, propertyA4);


%%
controller(state, controlVariables, propertyA4)