%{
   Author: Shane Kramer
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 01.31.15
   ---------------------------------------------------
   Time of flight from perigee to v0 function.
%}
function dt_per = timeOfFlightFromPtoV0( M, n )
  dt_per = M/n;
end