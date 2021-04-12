%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 03.10.15
   ---------------------------------------------------
   This is the central body + J2 acceleration computation 
   which is invoked by our acceleration interface.
%}
function [ acc ] = j2Acceleration( r )

    % Utilize our global constants
    global mu ER;

    J2 = 0.00108;

    rnorm = norm(r);

    sinphi = r(3)/rnorm;

    % Our J2 integration formula 
    interior = (1+3*J2/2*(ER/rnorm)^2*(1-5*sinphi^2));

    acc = -(mu/rnorm^3)*interior*r;
end

