%{
   Author: Shane Kramer
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 03.10.15
   ---------------------------------------------------
   This function returns eccentric anomaly given an
   eccentricity and a true anomaly.
%}
function [ E0 ] = EFromNu(nu1, e1)

    % Formula to calculate eccentric anomaly from true anomaly and
    % eccentricity.
    
    E0 = atan(sqrt(1-e1^2)*sin(nu1)/(e1+cos(nu1)));
    
    % If Ecdentric Anomaly is negative, make it positive
    if (E0 <0)
        E0 = E0 + 2*pi;
    elseif (E0 < pi)
        E0 = E0 + pi;
    end
end

