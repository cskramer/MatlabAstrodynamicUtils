%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 04.09.15
   ---------------------------------------------------
   This function computes topodetic matrix from ECEF given:

   latd: Geodetic latitude in radians
   lon: Longitude in radians
   altd: Height above geoid in meters 
%}
function [ T ] = topodetic( latd, lon, altd)

    X = [-sin(lon); cos(lon); 0.0];
    Y = [-sin(latd)*cos(lon); -sin(latd)*sin(lon); cos(latd)];
    Z = [ cos(latd)*cos(lon); cos(latd)*sin(lon); sin(latd)];
    
    T = zeros(3,3);
    T(1,1) = X(1); T(1,2) = X(2); T(1,3) = X(3);
    T(2,1) = Y(1); T(2,2) = Y(2); T(2,3) = Y(3);
    T(3,1) = Z(1); T(3,2) = Z(2); T(3,3) = Z(3);
    
end