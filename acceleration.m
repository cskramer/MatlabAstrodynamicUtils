%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 03.10.15
   ---------------------------------------------------
   This function provides a interface to select specific 
   acceleration models from a cardinal argument.
%}
function [ acc ] = acceleration(JDi, r, v, model)

    global mu_moon mu_sun
    
    % Central body acceleration
    if(model==1)
        acc = centralBodyAcceleration(r);
    end

    % Central body and J2 acceleration
    if(model==2)
        acc = j2Acceleration(r);
    end
    
    % Central body and Jacchia60 Drag
    if(model==3)
        acCB=centralBodyAcceleration(r);
        acJ60=jacchiaAcceleration(JDi, r, v);
        acc = acCB+acJ60;
    end
    
    % Central body and Sun and Moon gravity
    if(model==4)
        acCB=centralBodyAcceleration(r);
        rMoon = analyticMoon(JDi);
        rSun = analyticSun(JDi);
        aMoon=thirdBodyGravity(mu_moon, r, rMoon);
        aSun=thirdBodyGravity(mu_sun, r, rSun);
        acc = acCB+aMoon+aSun;
    end
    
    % Central body and Geopotential Acceleration (J2)
    if(model==5)
        acCB=centralBodyAcceleration(r);
        acGA=geopotentialAcceleration(r);
        acc = acCB+acGA;
    end
end

