%{
   Author: Shane Kramer
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 01.31.15
   ---------------------------------------------------
   Semi-latus rectum function.
%}
function sr = semiLatusRectum( hnorm, mu )
   sr = hnorm^2/mu;
end
