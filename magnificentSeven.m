%{
   Author: Shane Kramer
   Course: SPCE 5605 Modeling and Simulation
   Date: 04.18.15
   ---------------------------------------------------
   Returns the seven metrics below for our customer checkout simulation:
   1) Average customer waiting time
   2) Probability a customer had to wait
   3) Proportion of time the server was idle
   4) Average service time
   5) Average time between arrivals
   6) Average waiting time for customers who had to wait
   7) Average time a customer spends in system
%}
function [ averageWaitTime, waitProb, serverIdleProportion, averageServiceTime, ...
    averageTimeBetweenArrivals, averageNonZeroCustomerWaitTime, averageTimeInSystem] ...
    = magnificentSeven( customerRecords )

    numOfCustomers = size(customerRecords,1);

    % Average Customer waiting time:
    metricSums = sum(customerRecords);
    averageWaitTime = metricSums(7)/numOfCustomers;

    % Get counts/totals for our system:
    waitCount = 0;

    for i=1:size(customerRecords,1)
        if customerRecords(i,7) > 0
            waitCount = waitCount + 1;
        end
    end

    % Probability customer had to wait
    waitProb = waitCount/numOfCustomers;

    % Proportion of time server is idle
    totalIdleTime = (metricSums(9));
    totalTime = customerRecords(numOfCustomers,6);
    serverIdleProportion = totalIdleTime/totalTime;

    % Average service time
    averageServiceTime = metricSums(4)/numOfCustomers;

    % Average time between arrivals
    averageTimeBetweenArrivals = metricSums(2)/numOfCustomers;

    % Average waiting time for customers who had to wait
    averageNonZeroCustomerWaitTime = metricSums(7)/waitCount;

    % Average time a customer spends in the system
    averageTimeInSystem = metricSums(8)/numOfCustomers;

end

