%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 02.7.15
   ---------------------------------------------------
   This function accepts a starting true anomaly (v), 
   semi-major axis (a), and eccentricty (e) and returns
   the magnitude of the position vector (r).
%}
function r = radiusofOrbit(v, e, a)
   r = (a*(1-(e^2)))/(1+(e*cos(v)));
end

