%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 04.25.15
   ---------------------------------------------------
   This function returns the longitude of ascending node from 
   X and Y ECEF values. 
%}
function [ LAN ] = longAscendingNode( x, y)

LAN = atan2(y/x);
