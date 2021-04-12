%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 03.07.15
   ---------------------------------------------------
   This function returns a low precision formula for the 
   moon's position given an Julian Date. Based off of 2013
   Astonomical Almanac.
%}
function [ rmoon ] = analyticMoon(JD)

% Establish constants for our model
% ----------------------------------------------------
global Re;

% Number of Julian Centuries from J2000 epoch
% ----------------------------------------------------
T = (JD-2451545.0)/36525;

lambda = (218.32 + 481267.881*T ...
       + 6.29*sind(135.0+477198.87*T) - 1.27*sind(259.3-413335.36*T) ...
       + 0.66*sind(235.7+890534.22*T) + 0.21*sind(269.9+954397.74*T) ...
       - 0.19*sind(357.5+35999.05*T) - 0.11*sind(186.5+966404.03*T)); % degrees

beta = (5.13*sind(93.3+483202.02*T) + 0.28*sind(228.2+960400.89*T) ...
     - 0.28*sind(318.3+6003.15*T) - 0.17*sind(217.6-407332.21*T)); % degrees

parallax = (0.9508 ...
         + 0.0518*cosd(135.0+477198.87*T) + 0.0095*cosd(259.3-413335.36*T) ...
         + 0.0078*cosd(235.7+890534.22*T) + 0.0028*cosd(269.9+954397.74*T)); % degrees

% Lunar semidiameter
% ----------------------------------------------------
SD = 0.2724*parallax;
r = 1/sind(parallax);

% Geocentric direction cosines
% ----------------------------------------------------
l = cosd(beta)*cosd(lambda);
m = 0.9175*cosd(beta)*sind(lambda)-0.3978*sind(beta);
n = 0.3978*cosd(beta)*sind(lambda)+0.9175*sind(beta);
rmoon = Re*[r*l; r*m; r*n]; % Geocentric moon vector

end