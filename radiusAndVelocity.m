%{
   Author: Shane Kramer
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 02.04.15
   ---------------------------------------------------
   Function to find radius and veolcity vectors.
%}
function [Rp, Vp] = radiusAndVelocity( R0p, V0p, f, g, fdot1, gdot)
 Rp = f*R0p + g*V0p;
 Vp = fdot1*R0p + gdot*V0p;   
end