%{
   Author: Shane Kramer
   Course: SPCE 5065 Modeling and Simulation
   Date: 03.02.15
   ---------------------------------------------------
   Newton's Method for solving multivariate vector 
   functions.
%}
function x = NewtonsMultivariateMethod(f, Df, n, x1guess, x2guess)

x = [x1guess;x2guess];
for i = 1:n
    Dx = -Df(x)\f(x);
    x = x + Dx;
    f(x)
end