%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 02.13.15
   ---------------------------------------------------
   This function accepts mu, semi-major axis (a), 
   eccentricty (e), and true anomaly (v) values as 
   arguments and returns two perifocal vectors (rp and
   vp).
%}
function [ rp, vp ] = perifocalVectors(a, e, nu)

    % Utilize our global constants
    global mu;

    % Compute perifocal vectors
    % Input nu (true anomaly) expected in radians

    % Radius magnitude
    p = a*(1-e^2);
    r = p/(1+e*cos(nu));

    % Perifocal position and velocity
    rp = [r*cos(nu); r*sin(nu); 0.];
    vp = [-sqrt(mu/p)*sin(nu); sqrt(mu/p)*(e+cos(nu)); 0.];

end

