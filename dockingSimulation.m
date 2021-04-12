%{
   Author: Shane Kramer
   Course: SPCE 5605 Modeling and Simulation
   Date: 04.30.15
   ---------------------------------------------------
   This function performs a two vehicle docking simulation,
   where the # of docking/acceleration steps, and total
   docking time are calulated from:

   * closingVelocity - The initial closing velocity
   
   * k - Constant or proportionality for acceleration control.
   
   * adjustmentTime - The amount of time it takes to make an 
     adjustment
   
   * revisitTime -Time it takes astonaut to check velocity again.

   Acceleration control formula: a=-kv
%}
function [numSteps, totalTime, closingVelocity ] = ...
    dockingSimulation(closingVelocity, k, adjustmentTime, revisitTime)
%% ----------------------------------------------------
    global excelOut

    % Create our spreadsheet headers
    fprintf(excelOut, 'Step #, Beginning Time (sec), End Time (sec), Velocity (m/sec)\n'); % Header line

    numSteps = 0;
    totalTime = adjustmentTime;

    while( abs(closingVelocity) > .1 )
      fprintf(excelOut,' %2.0f, %5.1f, %5.1f, %6.4f,\n' ...
            , numSteps, totalTime, totalTime+15, closingVelocity); 

      deltaVelocity = 15 * (-k) * closingVelocity;
      closingVelocity = closingVelocity + deltaVelocity;
      totalTime = totalTime + adjustmentTime + revisitTime;
      numSteps = numSteps + 1;

    end
    % Adjust our steps
    fprintf(excelOut,' %2.0f, %5.1f, %5.1f, %6.4f,\n' ...
            , numSteps, totalTime, totalTime+15, closingVelocity); 

end