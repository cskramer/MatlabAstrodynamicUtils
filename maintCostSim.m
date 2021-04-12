%{
   Author: Shane Kramer
   Course: SPCE 5065 Modeling and Simulation
   Date: 05.04.2015
   ---------------------------------------------------
   This function returns the cost of maintenance for a component or
   group of componenets using a random number gernerator for a uniform
   distribution, and the mean and standard deviation parameters for 
   maintenance time.
%}
function [hours, cost] = maintCostSim( policy, iterations)
   cost = 0;
   
   if (policy == 1) % Single component policy
      % Random number from Normal distribution, mean standard deviation 
      
      for i=1:iterations
          mins(i) = normrnd(60,sqrt(15));
      end
      
      meanMins = mean(mins);
      
      hours = meanMins/60;
      % Cost for policy 1 maintenance
      cost = (100*meanMins/60) + 20;
      
   elseif (policy == 2) % Fix all components policy
      % Random number from Normal distribution, mean standard deviation
      
      for i=1:iterations
          mins = normrnd(150,sqrt(45));
      end
      
      meanMins = mean(mins);
      
      hours = meanMins/60;
      % Cost for policy 1 maintenance
      cost = (100*meanMins/60) + 80;
   end
 end