%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 02.7.15
   ---------------------------------------------------
   This function accepts a mean motion (mm), eccentricity (e), 
   mean anomaly (M) and eccentric anomaly (E), and the 
   time step (deltat) and returns the next eccentric anomaly 
   Enext).
%}
function Enext = nextEccentricAnomaly(mm, e2, M2, E2, deltat)
   Enext = E2 + ((mm*deltat + M2 - (E2-e2*sin(E2)))/1-e2*cos(E2));
   
   % Logic to put it in range [0,2pi]
   if(Enext<0)
     Enext = Enext + 2*pi;
   end
   
end


