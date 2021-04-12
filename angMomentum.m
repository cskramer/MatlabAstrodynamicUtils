%{
   Author: Shane Kramer
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 01.31.15
   ---------------------------------------------------
   Angular momentum function.
%}
function am = angMomentum( r, rd )
   am = cross(r,rd);
end

