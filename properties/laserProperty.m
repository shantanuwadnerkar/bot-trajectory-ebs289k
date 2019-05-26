function laserProperties = laserProperties

laserProperties = struct;

laserProperties.rangeMax = 60;
laserProperties.angleSpan = pi;
laserProperties.angleStep = laserProperties.angleSpan/360;
laserProperties.transformLaser = transl2(25, 1) * trot2(pi/2); % redefine to include more than one sensor.

end