%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 04.09.15
   ---------------------------------------------------
   This function computes ECEF site vectr based on geodetic 
   coordinates provided:

   lat: geodetic latitude of site in radians
   long: longitude of site in radians
   alt: geodetic altitude of site 
%}
function [ xb, yb, zb ] = siteVector( lat, lon, alt)
    
    % Establish constants for our model
    % ----------------------------------------------------
    global Re;
    global e2;
    
    sinlat = sin(lat);
    coslat = cos(lat);
    sinlon = sin(lon);
    coslon = cos(lon);
    
    S = sqrt(1-e2*sinlat^2);
    
    xb = (Re/S + alt)*coslat*coslon;
    yb = (Re/S + alt)*coslat*sinlon;
    zb = ((Re*(1-e2))/S + alt)*sinlat;
    
end