function [ x_array, y_array ] = lagrangeCenter( x, y, i, number_below, number_above )
% Creates an array of values centered about index i, with a specified
% number below and above the index. Count includes the index.
% For lagrange centering, presumably the value of interest is between
% indices (i-1) and i.
% Thus,
% for a 3rd order lagrange we could specify 2, 0, which would correspond
% to 2 below the index, and the index itself; so the interpolation array
% would correspond to 2 below, and one above the value of interest.
%
% (i-2) .. (i-1) .. i
%
% Or we could specify 1, 1, which would correspond to one below, plus the
% index, plus one more; so the interpolation array would correspond to
% one below and 2 above the value of interest.
%
% (i-1) .. i .. (i+1)
%
% x Array of x values
% y Array of y values
% i Index of interest (decided by calling routine)
% number_below Number of points below index i to include in the array
% number_above Number of points above index i to include in the array
    start_index = i-number_below;
    end_index = i+number_above;
    array_index = 0;
    
    for index=start_index:1:end_index
        array_index = array_index+1;
        x_array(array_index) = x(index);
        y_array(array_index) = y(index);
    end
    
end