function headlandManeuverBoolean = isHeadlandManeuver(R, C, N)

if isSameSide(R, C, N) == true
    headlandManeuverBoolean = true;
else
    headlandManeuverBoolean = false;
    


end