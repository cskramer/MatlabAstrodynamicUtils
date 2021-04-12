%{
   Author: Shane Kramer
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 01.31.15
   ---------------------------------------------------
   True Anomaly Function. tar = radians, tad=degrees.
%}
function [ tar, tad] = trueAnomaly( r, B )
   rnorm = norm(r);
   Bnorm = norm(B);
   
   cosnu = dot(r,B)/(rnorm*Bnorm);
   tar = acos(cosnu);
   
   tad = acosd(cosnu);
   
end