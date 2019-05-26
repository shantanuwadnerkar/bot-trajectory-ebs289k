function [turnType, turnDistance] = turnSelect(rowTransition, parameters)

if isPiTurn(rowTransition, parameters) == false
    turnDistance = distanceOmegaTurn(rowTransition, parameters);
    turnType = 'omega';
elseif isPiTurn == true
    turnDistancePi = distancePiTurn(rowTransition, parameters);
    turnDistanceOmega = distanceOmegaTurn(rowTransition, parameters);
    
    if turnDistancePi <= turnDistanceOmega
        turnDistance = turnDistancePi;
        turnType = 'pi';
    else
        turnDistance = turnDistanceOmega;
        turnType = 'omega';
    end
end

end