%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 03.07.15
   ---------------------------------------------------
   Function to return solar pressure acceleration vector,
   (based off the basic Ball Model) from a vector from the 
   satellite's position to the Sun (r), the Sun's position, 
   radiation coefficient (Cr), effective area exposed to 
   Sun (A), and the satellite's mass (mass).
%}
function [ a_srp ] = solarPressure(S)

% Establish constants for our model
% ----------------------------------------------------
global r Cr Sa mass;

r_sun_vehicle = r - S; % Use a vector diagram to verify if needed
rhat = r_sun_vehicle / norm(r_sun_vehicle);
Psr = 4.57e-6; % N/m^2, average value per Vallado
a_srp = Psr * Cr * Sa/mass * rhat;
end
