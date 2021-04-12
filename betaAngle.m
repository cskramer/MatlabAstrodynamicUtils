%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 05.10.15
   ---------------------------------------------------
   Compute orbit beta andle from r, SV position vector,
   v, sv velocity vector, and S, sun vector.
%}
function [ beta ] = betaAngle( r, v, S )
    h = cross(r, v);
    Sdoth = dot(S, h);
    beta = asin(Sdoth/(norm(S)*norm(h)));
end