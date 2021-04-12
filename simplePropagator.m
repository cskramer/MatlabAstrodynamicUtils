%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 04.09.15
   ---------------------------------------------------
   This function uses a simplistic approach to calculate
   position and velocity. It is intended for use over short
   time spans.
 
   dt: propagation stepsize
   r0: initial position
   v0: initial velocity
   a: acceleration
%}
function [ r1, v1 ] = simplePropagator( dt, r0, v0, a)
    
    r1 = r0 + v0*dt + 1/2*a*dt^2;
    v1 = v0 + a*dt;
    
end