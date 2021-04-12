%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 02.7.15
   ---------------------------------------------------
   This function accepts a mu value, and r and rd vectors
   as arguments and returns the 6 Keplerian elements;
   Semi-major axis (a), eccentricity (e), inclination (i).
   right ascension of the asending node (raan), argument
   of perigee (wp), and true anomaly (v).
%}

function [ a, e, i, raan, wp, nu, MA ] = keplerianElements( r, v)
    global mu;

    twopi = 2.*pi;
    rmag = norm(r);
    
    % FIND ANGULAR MOMENTUM (i)
    h = cross(r,v);
    h_hat = h/norm(h);
    i = acos(h_hat(3));
    
    % FIND ENERGY AND THEN SEMI-MAJOR AXIS (a)
    energy = dot(v,v)/2.0-mu/rmag;
    a = -mu/(2.0*energy);
    
    % FIND LAPLACIAN AND ECCENTRICITY (e)
    hv = cross(h,v);
    B = (-mu/rmag)*r - hv;
    e = norm(B)/mu;
    
    % FIND RIGHT ASCENSION (raan)
    raan=atan2(h(1),-h(2));
    if(raan < 0.0)
        raan = raan+twopi;
    end
    
    % FIND ARGUMENT OF PERIGEE (wp) 
    % Node Vector (= Z-axis x Ang. Momentum)
    Z=[0, 0, 1];
    Nvec = cross(Z, h);
    
    % Compute dot and cross products as required for ATAN2
    NcrossB = cross(Nvec, B);
    NcBmag = dot(h_hat, NcrossB) ;
    NdotB = dot(Nvec, B);
    
    % Magnitude of cross product = (sign)NB sin(wp). Dot product is NP cos(wp)
    wp = atan2(NcBmag, NdotB);
    if(wp < 0.0)
        wp = wp + twopi;
    end
    
    % FIND ECCENTRIC ANOMALY AND TRUE ANOMALY (v)
    Enum = dot(r,v)/sqrt(mu*a); % numerator and denominator for atan2
    Eden = 1. - rmag/a;
    E0 = atan2(Enum,Eden);
    SE=sqrt(1.0-e*e);
    sin_nu = SE*sin(E0)/(1.0-e*cos(E0));
    cos_nu =(cos(E0)-e)/(1.0-e*cos(E0));
    nu=atan2(sin_nu,cos_nu);
    if(nu < 0.0)
        nu = nu + twopi;
    end
    
    % Compute Mean Anomaly
    MA = E0 - e*sin(E0);
    % KEPLERIAN ELEMENTS HAVE BEEN COMPUTED, RETURN TO CALLING ROUTINE
end

