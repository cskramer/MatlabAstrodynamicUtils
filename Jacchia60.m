%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 03.07.15
   ---------------------------------------------------
   This function utilized the Jacchia 1960 atmospere model
   to determine atmospheric density (rho) given an MJD, a
   r position vector, a sun vector, and an F10 solar flux value.
%}
function [ rho ] = Jacchia60(JDi)

% Establish constants for our model
% ----------------------------------------------------
global r F10 SUN;

f2m = 0.3048; % Feet to meters
nm2f = 6076.115485; % Nautical mile to feet
nm2m = 1852.; % Nautical mile to meters
sf3_kgm3 = 515.37886; % Square feet to kilogram per meter cubed 
f = 1./298.257223563;

Ee = sqrt(2.*f - f*f);
e2 = Ee*Ee;
bulge_lag_angle = 0.55; % radians. Lag of bulge from sun
cb = cos(bulge_lag_angle);
sb = sin(bulge_lag_angle);

[midnight, base_time] = greg2Julian(1957,12,31,0,0,0.);

rho = 0.0;

[lat, lon, h] = geodeticLatLonAlt();

h = h/1852; % Altitude comes back in meters, convert to NM for the model
%fprintf(fid, 'h: %11.6f NMi\n',h);

d = (JDi-base_time); % Days since 12/31/57

SUN = SUN/norm(SUN); % Units sun vector
rnorm = norm(r);

% Unit vector to midpoint of diurnal bulge
U = [(SUN(1)*cb - SUN(2)*sb); (SUN(2)*cb + SUN(1)*sb); SUN(3)];

Unorm = norm(U);
% Compute the angle from the bulge:
cos_psi = dot(r, U)/(rnorm*Unorm);

psi = acos(cos_psi);
%fprintf(fid, 'psi: %11.6f deg\n',psi*180/pi);

% F10 in the model is 1/100 of the input value F10 = F10/100.;
% Compute density in 1st band

if((h>=76.) && (h<108.))
    rho76 = 0.558e-11;
    rho = rho76 * ((76./h)^7.18) ...
        * ((108.-h)/32. + 0.85*F10*(((h-76.)/32.)^(4./3.))) ...
        * (1. + ((h-76.)/1224.)*((1.+ cos_psi)^3));
end

if((h>=108.) && (h<378.))
    a = 0.00368;
    b = 15.738;
    rho0 = sf3_kgm3 * exp( (6.363*exp(-0.0048*h) - a*h -b) * log(10.));
    rho = rho0*(0.85*F10)* (1. + 0.02375*(exp(0.0102*h)-1.9)*((1.+ cos_psi)^3));
end

if((h>=378.) && (h<=1000.))
    rho = sf3_kgm3 * ((0.00504*F10)/(h^8)) ...
        * ( 0.125*((1.+ cos_psi)^3) * ((h^3) - 6.e6) + 6.e6 );
end

if(h>1000.)
    rho = 0.0;
end