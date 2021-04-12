%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 03.10.15
   ---------------------------------------------------
   This function returns f and g values using delta E
   (eccentric anomaly in radians). Arguments are delta E,
   dt (delta time), a (semi major axis), r0, and r1 
   vectors.

   Based off of Vallado eq 2-63
%}
function [ f, g, fdot, gdot ] = fgDeltaE( ro, r1, a, dE)

    % Utilize our global constants
    global mu stepSize;

    f = 1-(a/ro)*(1-cos(dE));
    g = stepSize-sqrt(a^3/mu)*(dE-sin(dE));

    fdot = -sin(dE)*sqrt(mu*a)/(ro*r1);
    gdot = 1 -(a/r1)*(1-cos(dE));
end

