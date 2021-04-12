%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 03.07.15
   ---------------------------------------------------
   This function returns a third body gravitation acceleration
   vector given a gravitational constant for third body (mu3b),
   an ECI position vector for SV (R), and an ECI position 
   vector for 3rd body (Rk).
%}
function [ a3b ] = thirdBodyGravity( mu3b, r, Rk)

    D = Rk - r; % Difference vector
    D3 = (norm(D))^3;
    Rk3 = (norm(Rk))^3;
    a3b = mu3b*(D/D3 - Rk/Rk3);
    
end