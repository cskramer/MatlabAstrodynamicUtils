%{
   Author: Shane Kramer
   Course: SPCE 5105 Remote Sensing
   Date: 11.4.15
   ---------------------------------------------------
   This function will take a matric, determine the lowest
   value of the matrix, and if that value is less than 0 it
   will add the difference (abs(lowest-0)) and add that value
   to every other element.
%}
function [outputImage] = unbias(inputImage)

% ----------------------------------------------------
% Establish constants
% ----------------------------------------------------
 
% Determine the bias
minimum = min(min(inputImage));

if minimum < 0 
   bias = abs(minimum);

   [pixelMapSizeX,pixelMapSizeY] = size(inputImage);

   for m = 1:pixelMapSizeX
      for n = 1:pixelMapSizeY
         % unbias
         outputImage(m,n) = (inputImage(m,n) + bias);
      end
   end
else
    outputImage = inputImage;
end