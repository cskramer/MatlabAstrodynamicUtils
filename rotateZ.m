%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 04.09.15
   ---------------------------------------------------
   This function returns a matrix rotated by an angle in 
   radians. 
%}
function [ Tz ] = rotateZ( angle )
    
    Tz = zeros(3,3);
    Tz(1,1) = cos(angle); Tz(1,2) = sin(angle); Tz(1,3) = 0.0;
    Tz(2,1) = -sin(angle); Tz(2,2) = cos(angle); Tz(2,3) = 0.0;
    Tz(3,1) = 0.0; Tz(3,2) = 0.0; Tz(3,3) = 1.0;
    
end