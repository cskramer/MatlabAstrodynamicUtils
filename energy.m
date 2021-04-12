%{
   Author: Shane Kramer
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 01.31.15
   ---------------------------------------------------
   Energy function.
%}
function en = energy( rnorm, mu, rd )
   en = dot(rd,rd)/2 - mu/rnorm;
end
