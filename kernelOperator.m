%{
   Author: Shane Kramer
   Course: SPCE 5105 Remote Sensing
   Date: 11.4.15
   ---------------------------------------------------
   This is the kernel function for homework 4.
   It will caculate DNs using kernel passes, given an 
   array if DN values.
%}
function [outputImage] = kernelOperator(inputImage, kernelMap)

% ----------------------------------------------------
% Establish constants
% ----------------------------------------------------
 
[pixelMapSizeX,pixelMapSizeY] = size(inputImage);

for m = 2:pixelMapSizeX-1
   for n = 2:pixelMapSizeY-1
      
       disp(inputImage(m,n));
       
       % Apply operator
       outputImage(m-1,n-1) = round(...
           (inputImage(m-1,n-1) * kernelMap(1,1)) + ...
           (inputImage(m,n-1) * kernelMap(1,2)) + ...
           (inputImage(m+1,n-1) * kernelMap(1,3)) + ...
           (inputImage(m-1,n) * kernelMap(2,1)) + ...
           (inputImage(m,n) * kernelMap(2,2)) + ...
           (inputImage(m+1,n) * kernelMap(2,3)) + ...
           (inputImage(m-1,n+1) * kernelMap(3,1)) + ...
           (inputImage(m,n+1) * kernelMap(3,2)) + ...
           (inputImage(m+1,n+1) * kernelMap(3,3)));
   end
end