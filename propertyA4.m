function propertyA4 = propertyA4

addpath('properties\');

propertyA4 = struct;

% Maintain this order
propertyA4.robotProperty = robotProperty;
propertyA4.controllerProperty = controllerProperty;
propertyA4.pathProperty = pathProperty;
propertyA4.purePursuitControllerProperty = purePursuitControllerProperty;
propertyA4.plotProperty = plotProperty(propertyA4);
end