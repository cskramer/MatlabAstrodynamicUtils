function [ Px ] = thirdOrderLagrange( x, y, xval )
% 3rd Order Lagrange Interpolation (Actually, only 2nd order, 3-point)
% x 3-element array centered (somehow) on xval
% y 3-element array corresponding to x_array
% xval Value at which to interpolate the value Px
% Function assumes that the proper centering of the array about xval has
% already been done by the calling routine.
    Px = (xval-x(2))*(xval-x(3))/((x(1)-x(2))*(x(1)-x(3)))*y(1) ...
    + (xval-x(1))*(xval-x(3))/((x(2)-x(1))*(x(2)-x(3)))*y(2) ...
    + (xval-x(1))*(xval-x(2))/((x(3)-x(1))*(x(3)-x(2)))*y(3);
end