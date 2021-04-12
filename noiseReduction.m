%{
   Author: Shane Kramer
   Course: SPCE 5105 Remote Sensing
   Date: 11.4.15
   ---------------------------------------------------
   This is the noise reduction function for homework 4.
   I will apply a noise reduction pass with a weight
   reduction of 2.
%}
function [DN5] = noiseReduction(problem1DNs, weight)

aveA = (problem1DNs(1,1) + problem1DNs(1,3) + problem1DNs(3,1) + problem1DNs(3,3))/4;
aveB = (problem1DNs(1,2) + problem1DNs(2,1) + problem1DNs(2,3) + problem1DNs(3,2))/4;

diff = abs(aveA - aveB);
thresh = diff * weight;

if abs(problem1DNs(2,2) - aveA) > thresh || abs(problem1DNs(2,2) - aveB)> thresh
   DN5 = aveB;
else
   DN5 = problem1DNs(2,2);
end


