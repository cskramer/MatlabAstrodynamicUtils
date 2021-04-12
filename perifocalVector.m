%{
   Author: Shane Kramer
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 02.04.15
   ---------------------------------------------------
   Perifocal vector function.
%}
function [x, y, xdot, ydot] = perifocalVector( tar, mu, rnorm, e, p )
  x = rnorm*cos(tar);
  y = rnorm*sin(tar);
  xdot = -sqrt(mu/p)*sin(tar);
  ydot = sqrt(mu/p)*(e+cos(tar));
   
end