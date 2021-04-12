%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 03.07.15
   ---------------------------------------------------
   Function to return an geodetic lat, lon, and altitude
   given an ECEF position vector.
%}
function [ lat, lon, alt] = geodeticLatLonAlt(r)

    % Establish constants for our model
    % ----------------------------------------------------
    global Re;

    f = 1./298.257223563;
    be = Re*(1-f);
    e = sqrt(2.*f - f*f);
    e2 = e^2;
    rnorm = norm(r);
    lat_last = asin(r(3)/rnorm);
    tolerance = 1e-10;
    update = 10;

    while(abs(update)>tolerance)
        tanlat = (r(3)+(Re*e2)/sqrt(1+(be/Re)^2)*(tan(lat_last)^2))/sqrt(r(1)^2+r(2)^2);
        lat = atan(tanlat);
        update = lat-lat_last;
        lat_last = lat;
    end

    XY = (r(1)^2+r(2)^2)/Re^2;
    Z = r(3)^2/be^2;

    alt = rnorm*(1-1/sqrt(XY + Z)); % altitude in meters
    lon = atan2(r(2), r(1));

    if(lon<0)
        lon = lon + 2*pi;
    end

end