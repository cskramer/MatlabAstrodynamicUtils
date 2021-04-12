%{
   Author: Shane Kramer
   Course: SPCE 5065 Modeling and Simulation
   Date: 02.26.15
   ---------------------------------------------------
   Gauss Function that accepts a linear system as an 
   argument, and utilizes Gaussian Elimination and
   Substitution to solve the system.
%}
function x = GaussElimination(ab)

[R, C] = size(ab);
% Perform Gaussian Elimination
for j = 1:R-1
    for i = j+1:R
        ab(i,j:C) = ab(i,j:C)-ab(i,j)/ab(j,j)*ab(j,j:C);
    end
end

% Perform Gaussian Substitution
x = zeros(R,1);
x(R) = ab(R,C)/ab(R,R);
for i = R-1:-1:1
    x(i) = (ab(i,C)-ab(i,i+1:R)*x(i+1:R))/ab(i,i);
end