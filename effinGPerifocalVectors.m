%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 02.13.15
   ---------------------------------------------------
   This function accepts initial perifocal vectors
   R0p, VOp, and f and g values to return then next  
   perifocal vector set (Rp, Vp).
%}

function [ Rp, Vp ] = effinGPerifocalVectors( R0p, V0p, f, g, fdot, gdot)
   Rp = f*R0p + g*V0p;
   Vp = fdot*R0p + gdot*V0p;
end
