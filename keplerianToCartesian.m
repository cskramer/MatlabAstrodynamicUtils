%{
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 03.23.15
   ---------------------------------------------------
   Keplerian to Cartesian transformation (position and 
   velocity vectors). Input angles are in radians
%}
function [ r_eci, v_eci] = keplerianToCartesian( a, e, i, O, wp, nu)
 
 % Utilize our global constants
 global mu;

% Function to compute position and velocity in perifocal frame
[rp, vp] = perifocalVectors(a, e, nu);

% Function to compute perifocal to ECI transformation
[T] = perifocalToECI(i, O, wp);
r_eci = T*rp;
v_eci = T*vp;
end