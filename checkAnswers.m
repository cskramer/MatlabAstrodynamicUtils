%{
   Author: Shane Kramer
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 01.31.15
   ---------------------------------------------------
   Function to find x, y, xdot, ydot.
%}
function [Rp, Vp] = checkAnswers( tar, mu, p, e, degrees)
   dnu = degrees*pi/180.;
   
   % To find f, we need the radius at nu+degrees
   nuplusDegrees=tar+dnu;
   
   r = p/(1+e*cos(nuplusDegrees));
   
   x2 = r*cos(nuplusDegrees);
   y2 = r*sin(nuplusDegrees);
   xdot = -sqrt(mu/p)*sin(nuplusDegrees);
   ydot = sqrt(mu/p)*(e+cos(nuplusDegrees));

   % form into vectors r0 and v0
   Rp=[x2; y2; 0.];
   Vp=[xdot; ydot; 0.];
   
end