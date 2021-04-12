%{
   Author: Shane Kramer
   Course: SPCE 5065 Modeling and Simulation
   Date: 02.26.15
   ---------------------------------------------------
   Gauss Function that accepts a linear system as an 
   argument, and utilizes Gaussian Elimination to 
   determine the inverese of the matrix(linear system).
%}
function ab = GaussMatrixInverse(ab)

[R, C] = size(ab);
tol = 1.e-6;

% Get the non identity portion of the matrix for validation of 
% results later
original = ab([1,2,3],[1,2,3]);

% Perform Gaussian Elimination
for j = 1:R-1
    for i = j+1:R
        ab(i,j:C) = ab(i,j:C)-ab(i,j)/ab(j,j)*ab(j,j:C);
    end
end

% Set the diagonal of the initial sytem to 1
for j = 1:R
    coeff = 1/(ab(j,j));
    disp(coeff);
    for i = 1:C
        ab(j,i)= ab(j,i)*coeff;
         
        % Change all 0.000 values to 0
        ab(ab<0 & ab>-tol) = 0;
    
    end
end

% Perform Gauss-Jordan steps to reduce row elements to 0
for j = R-1:-1:1
    for i = R:-1:1
        
        % If cell is to the right of identity diagonal
        if (i>j && i<=R)
            
            %Determine the difference between the column and row
            % so the appropriate pivot row cam be used
            diff = i-j;
            
            % Determine the coefficient from the pivot row
            coeff = -(ab(j,i)/ab(j+diff,i));
            
            % Multiply the entire row by the coefficient
            ab(j,:) = (ab(j,:) + coeff*(ab(j+diff,:)));
        end
    end
end

% Check answer and display
inverse = ab([1,2,3],[4,5,6]);
inverse(inverse<0 & inverse>-tol) = 0;

identity = inverse*original;
identity(identity<0 & identity>-tol) = 0;

disp(identity);

