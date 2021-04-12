%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 03.10.15
   ---------------------------------------------------
   This function solves Kepler's equation to find E1
   given an initial MA and dt
%}
function [ E1 ] = keplerEquation( a, e, M0, dt)

    % Utilize our global constants
    global mu numSteps;

    n = sqrt(mu/a^3); % Mean motion
    tolerance = 1e-10;
    update = 100000; % Initialize to a big number

    Ek = M0; % As a first estimate, set Ek to input mean anomaly
    iteration = 0;

    % The logic uses the absolute value of the update, which could be positive
    % or negative.
    while (abs(update)>tolerance && (iteration<=numSteps));

        %{
          Newtonian iteration has the following form:
          Ek+1 = Ek - f(E)/f'(E)
        %}

        % Function and derivative are as shown (see, e.g., Vallado sect 2.2.5)
        f=n*dt+M0-(Ek-e*sin(Ek));
        fp= -(1-e*cos(Ek));

        % We compute update as a separate variable for use in the "While" logic
        update = f/fp;

        % Compute updated estimate
        Ekp1=Ek-update;
        iteration = iteration+1;

        % Set up Ek for the next iteration
        Ek=Ekp1;
    end

    % Set the return value to the converged
    E1=Ekp1;

end
