%{
   Author: Shane Kramer
   Course: SPCE 5065 Modeling and Simulation
   Date: 05.04.2015
   ---------------------------------------------------
   This function generates an array of maintenance occurence times, with 
   each time being the average over (iterations) until a final time of (simTime - 
   hours) is met. The failure times are generated randomly from the mean of
   iterations * random number from a uniform distribution on the interval 
   1000-2000.
%}
function [componentMaintTimes, componentMaintCosts, downtime]...
    = failureSim(iterations, simTime, policy)
   
   % Initialize our array, time and iteration counter
   componentMaintTimesLarge = zeros(200);
   componentMaintCostsLarge = zeros(200);
   
   currentTime = 0;
   downtime = 0;
   i=1; 
   maintDuration = 0;
   
  while (currentTime < simTime)
      
       if (policy == 1)
          % Create a vector containing all of our failure times from a uniform
          % distibution on the interval 1000-2000 hours. 
          lowerBoundary = 1000;
          upperBoundary = 2000;
          
          %Return array of 1000 (iterations) maintenance times for each
          %component
          c1MaintenanceTimes = (upperBoundary-lowerBoundary).*rand(iterations,1) + lowerBoundary;
          c2MaintenanceTimes = (upperBoundary-lowerBoundary).*rand(iterations,1) + lowerBoundary;
          c3MaintenanceTimes = (upperBoundary-lowerBoundary).*rand(iterations,1) + lowerBoundary;
          c4MaintenanceTimes = (upperBoundary-lowerBoundary).*rand(iterations,1) + lowerBoundary;

          %Return our array of maintenance times
          componentMaintTimesLarge(i) = currentTime + mean(c1MaintenanceTimes) + maintDuration;
          componentMaintTimesLarge(i+1) = currentTime + mean(c2MaintenanceTimes) + maintDuration;
          componentMaintTimesLarge(i+2) = currentTime + mean(c3MaintenanceTimes) + maintDuration;
          componentMaintTimesLarge(i+3) = currentTime + mean(c4MaintenanceTimes) + maintDuration;
          
          maintTimesArray = [mean(c1MaintenanceTimes), mean(c2MaintenanceTimes),mean(c3MaintenanceTimes),mean(c4MaintenanceTimes)];
          maintTimesArray = sort(maintTimesArray);
          
          % Add the time our last maintenance occurs to our our current timem
          currentTime = currentTime + maintTimesArray(4);
         
          % Run simulations for each componenet to determine cost and add our component downtimes downtime to the
          % next running time. 
          [c1MaintDuration, componentMaintCostsLarge(i)] = maintCostSim(1, iterations);
          [c2MaintDuration, componentMaintCostsLarge(i+1)] = maintCostSim(1, iterations);
          [c3MaintDuration, componentMaintCostsLarge(i+2)] = maintCostSim(1, iterations);
          [c4MaintDuration, componentMaintCostsLarge(i+3)] = maintCostSim(1, iterations);
      
          % Update our total downtime
          downtime = downtime + c1MaintDuration + c2MaintDuration + c3MaintDuration + c4MaintDuration;
          
          i = i+4;
          
       elseif (policy == 2)
          % Create a vector containing all of our failure times from a uniform
          % distibution on the interval 1000-2000 hours. 
          lowerBoundary = 1000;
          upperBoundary = 2000;
          maintenanceTimes = (upperBoundary-lowerBoundary).*rand(iterations,1) + lowerBoundary;

          %Return array of 1000 (iterations) maintenance times
          componentMaintTimesLarge(i) = currentTime + mean(maintenanceTimes) + maintDuration;
     
          currentTime = currentTime + mean(maintenanceTimes);
      
          % add to our cost array and be sure to add our system downtime to the
          % next running time. 
          [maintDuration, componentMaintCostsLarge(i)] = maintCostSim(2, iterations);
      
          % Update our total downtime
          downtime = downtime + maintDuration;
      
          i = i+1;
       end
   end
   
   % Trim all of the preallocated 0s our of our array
   componentMaintTimes = componentMaintTimesLarge(componentMaintTimesLarge ~= 0);
   componentMaintTimes = sort(componentMaintTimes);
   
   componentMaintCosts = componentMaintCostsLarge(componentMaintCostsLarge ~= 0);
   
end
