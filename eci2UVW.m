%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 04.25.15
   ---------------------------------------------------
   This function returns U,V,W vectors from cartesian r 
   and p vectors. 
%}
function [ T ] = eci2UVW( r, v)

rmag = norm(r);
vmag = norm(v);
U=r/rmag;
W=cross(r,v)/(rmag*vmag);
V = cross(W,U);

T = [U(1) U(2) U(3); V(1) V(2) V(3); W(1) W(2) W(3)];