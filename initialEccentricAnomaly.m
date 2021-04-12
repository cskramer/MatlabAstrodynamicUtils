%{
   Author: Shane Kramer
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 01.31.15
   ---------------------------------------------------
   Initial eccentric anomaly function.
%}
function E0 = initialEccentricAnomaly( rnorm, nu, a, e )
  
  sinE = rnorm*sin(nu)/(a*sqrt(1-e^2));
  cosE = (e+cos(nu))/(1+e*cos(nu));
  
  % Use ATAN2 to get E0 in range of [-pi,pi]
  E0 = atan2(sinE, cosE);

  % Logic to put it in range [0,2pi]
  if(E0<0)
     E0 = E0 + 2*pi;
  end
   
end