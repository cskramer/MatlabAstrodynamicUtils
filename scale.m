%{
   Author: Shane Kramer
   Course: SPCE 5105 Remote Sensing
   Date: 11.4.15
   ---------------------------------------------------
   This function will calculate a scaling coefficient for
   an array of DN values and apply it to an image.
%}
function outputImage = scale(lowDN, ...
    availableValues, inputImage)

[pixelMapSizeX,pixelMapSizeY] = size(inputImage);

% Determine the min and max values of our image
minimum = min(min(inputImage));
maximum = max(max(inputImage));

bias = 0;

if minimum < lowDN
     bias = lowDN - minimum;
end

for m = 1:pixelMapSizeX
   for n = 1:pixelMapSizeY
      % unbias
      outputImage(m,n) = round(((inputImage(m,n) - minimum) / ...
          (maximum-minimum) * availableValues) + bias);
   end
end