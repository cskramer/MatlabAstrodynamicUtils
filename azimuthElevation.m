%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 04.09.15
   ---------------------------------------------------
   This function computes the azimuth and elevation from:
 
   r: an ECEF relative SV to station vector
   T: topocentric transformation matrix
%}
function [ az, el ] = azimuthElevation( r, T)
    rt = T*r; % Convert to topocentric
    
    S = sqrt(rt(1)^2 + rt(2)^2);
    
    sinAz = rt(1)/S;
    cosAz = rt(2)/S;
    
    az = atan2(sinAz, cosAz);
    
    if(az<0.)
        az = az + 2*pi;
    end
    
    el = atan(rt(3)/S);
    
end