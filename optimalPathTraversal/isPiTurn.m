function piTurnBoolean = isPiTurn(rowTransition, parameters)

d = abs(rowTransition(1) - rowTransition(2));
w = parameters(1); % correct this
rMin = parameters(2); % correct this

if d*w > 2*rMin
    piTurnBoolean = true;
else
    piTurnBoolean = false;
end
