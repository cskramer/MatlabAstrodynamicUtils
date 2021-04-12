%{
   Author: Shane Kramer
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 01.31.15
   ---------------------------------------------------
   Semi-major axis function 
%}
function sma = semiMajorAxis( energy )
    global mu;
    sma = -mu/(2*energy);
end
