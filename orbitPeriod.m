%{
   Author: Shane Kramer
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 01.31.15
   ---------------------------------------------------
   Orbit period function.
%}
function op = orbitPeriod( a, mu )
   op = 2*pi*sqrt(a^3/mu);
end