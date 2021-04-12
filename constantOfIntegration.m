%{
   Author: Shane Kramer
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 01.31.15
   ---------------------------------------------------
   Constant of Integration function.
%}
function ci = constantOfIntegration( rd, h, mu, rnorm, r )
   ci = cross(rd,h)-(mu/rnorm)*r;
end