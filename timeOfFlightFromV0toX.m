%{
   Author: Shane Kramer
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 01.31.15
   ---------------------------------------------------
   Time of flight from v0 to X degrees function.
%}
function [nuDegrees, rDegrees, EDegrees, dtDegrees] = timeOfFlightFromV0toX( a, e, n, E0, degrees )
  % Now compute radius, eccentric anomaly, and other

  % parameters for nu = X degrees
    nuDegrees = degrees*pi/180.;

  % Need to compute radius of orbit at nu=X deg
    rDegrees = a*(1-e^2)/(1+e*cos(nuDegrees));

  % Compute eccentric anomaly for nu=X
    sinEDegrees = rDegrees*sin(nuDegrees)/(a*sqrt(1-e^2));
    cosEDegrees = (e+cos(nuDegrees))/(1+e*cos(nuDegrees));

  % Use ATAN2 to get EX in range of [-pi,pi]
    EDegrees = atan2(sinEDegrees, cosEDegrees);

  % Logic to put it in range [0,2pi]
    if(EDegrees < 0)
      EDegrees = EDegrees + 2*pi;
    end

  % compute time of flight from initial nu, to nu=degrees deg
  % Here we assume no perigee crossing between the two points
    dtDegrees = 1/n*(EDegrees-e*sin(EDegrees))-1/n*(E0-e*sin(E0));
    
end