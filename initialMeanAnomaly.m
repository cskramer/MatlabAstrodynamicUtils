%{
   Author: Shane Kramer
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 01.31.15
   ---------------------------------------------------
   Initial mean anomaly function.
%}
function M = initialMeanAnomaly( E0, e )
  M = E0 - e*sin(E0);
end