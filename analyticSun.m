%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 03.07.15
   ---------------------------------------------------
   This function returns a low precision formula for the 
   Sun's position given an Julian Date (Universal Time). 
   Based off of 2013 Astonomical Almanac.
%}
function [ rsun ] = analyticSun(JD)

% Establish constants for our model
% ----------------------------------------------------

d2r = pi/180; % degrees to radians conversion
twopi = 2*pi;

AU = 149597870700; % meters (IAU values, 2012)

% Days from J2000 epoch (UT)
% ----------------------------------------------------
n = JD-2451545.0;

% Mean Longitude of sun, corrected for aberration
% ----------------------------------------------------
L = (280.460+0.9856474*n)*d2r; % radians
L = mod(L, twopi);

if(L<0)
    L = L+twopi;
end

% Mean Anomaly
% ----------------------------------------------------
g = (357.528+0.9856003*n)*d2r; % radians
g = mod(g, twopi);

if(g<0)
    g = g+twopi;
end

% Ecliptic Longitude and latitude
% ----------------------------------------------------
lambda = L + 1.915*d2r*sin(g) + 0.020*d2r*sin(2*g);
beta = 0.0;

% Obliquity of Ecliptic
% ----------------------------------------------------
epsilon = (23.439-0.0000004*n)*d2r;

% Right Ascension and declination (not used for rsun)
% ----------------------------------------------------
f=180/pi;
t = (tan(epsilon/2))^2;
alpha = lambda - f*t*sin(2*lambda) + (f/2)*t^2*sin(4*lambda);
delta = asin(sin(epsilon)*sin(lambda));

% Distance from Earth to Sun in AU
% ----------------------------------------------------
R = 1.00014-0.01671*cos(g)-0.00014*cos(2*g);

% ECI coordinates of sun in AU
% ----------------------------------------------------
rsun = [R*cos(lambda); R*cos(epsilon)*sin(lambda); R*sin(epsilon)*sin(lambda)];

% Convert to meters
% ----------------------------------------------------
rsun = AU*rsun;
end