%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 03.10.15
   ---------------------------------------------------
   This is the Jacchia drag computation which
   is invoked by our acceleration interface.
%}
function [ acceleration ] = jacchiaAcceleration(JDi, r, v)

    % Utilize our global constants
    global omega Cd A mass;

    vr = v - cross(omega,r); % relative wind velocity
   
    [rho] = Jacchia60(JDi);
    
    vrnorm = norm(vr);
    vrhat = vr/vrnorm;
    
    acceleration = -1/2*Cd*A/mass*rho*vrnorm^2 * vrhat;
   
end