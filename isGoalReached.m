function goalReachedBoolean = isGoalReached(state, propertyA4)

    globalGoalXY = [propertyA4.controllerProperty.goalX - state(1, 1); propertyA4.controllerProperty.goalY - state(2, 1)];   
    globalGoalDistance = hypot(globalGoalXY(1), globalGoalXY(2));
    
    if globalGoalDistance <= propertyA4.controllerProperty.epsilonGoal
        goalReachedBoolean = true;
    else
        goalReachedBoolean = false;
    end
    end