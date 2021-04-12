function [ y ] = linearInterpolate( x_low, x, x_high, y_low, y_high)
% Perform linear interpolation on y for input independent variable x
% Assumes that the bounding points have been established by the calling
% routine.
f = (x-x_low)/(x_high-x_low);
y = f*y_high + (1-f)*y_low;
end