%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 02.7.15
   ---------------------------------------------------
   This function accepts a normalized r (rnorm), a true
   anomaly in radians (v1rad, semi-major axis (a), and 
   eccentricty (e) and returns the initial eccentric 
   velocity (E0).
%}
function  mm = meanMotion(mu, a1)
    mm = sqrt(mu/a1^3);
end

