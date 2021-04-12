%{
   Author: Shane Kramer
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 02.04.15
   ---------------------------------------------------
   Function to find f, g, fdot, gdot for a specific deg.
%}
function [f, g, fdot1, fdot2, gdot] = effinG( degrees, tar, p, e, mu, rnorm)
 
  dnu = degrees*pi/180.;
  
  % To find f, we need the radius at nu+33 deg
  nuplusDegrees=tar+dnu;
  r = p/(1+e*cos(nuplusDegrees));
  f = 1-(r/p)*(1-cos(dnu));
  g = (r*rnorm)/sqrt(mu*p)*sin(dnu);
  gdot = 1-(rnorm/p)*(1-cos(dnu));

  % compute fdot using both available methods
  fdot1 = (f*gdot-1)/g;
  fdot2 = sqrt(mu/p)*tan(dnu/2)*((1-cos(dnu))/p - 1/r - 1/rnorm);
   
end