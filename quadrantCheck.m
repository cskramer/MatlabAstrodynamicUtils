%{
   Author: Shane Kramer
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 01.31.15
   ---------------------------------------------------
   Check sign and adjust for quadrant.
%}
function [ sign, tar, tad] = quadrantCheck( r, rd, tar, tad )
  sign = dot(r, rd);
  
  %Check sign and adjust for quadrant if sign is negative
  if( sign < 0 )
     tar = 2*pi - tar;
     tad = 360. - tad;   
  end
   
end