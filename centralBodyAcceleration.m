%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 03.10.15
   ---------------------------------------------------
   This is the central body acceleration computation which
   is invoked by our acceleration interface.
%}
function [ acceleration ] = centralBodyAcceleration(r)

    % Utilize our global constants
    global mu;

    rnorm = norm(r);
    acceleration = -(mu/rnorm^3)*r;

end
