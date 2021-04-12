%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 02.7.15
   ---------------------------------------------------
   This function accepts a starting eccentric anomaly (E), 
   semi-major axis (a), and eccentricty (e) and returns
   the next radius magnitude (rnext).
%}
function rnext = eccentricRadiusofOrbit(a, e, E)
   rnext = a*(1-e*cos(E));
end
