%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 02.7.15
   ---------------------------------------------------
   This function accepts the semi-major axis, eccentricty,
   mu, and beginning and end Eccentric anomalies (E0, E) to
   calculate time of flight (tof).
%}
function tof = timeOfFlight( mm, e, E0, E )
    tof = abs(1/mm*(E-e*sin(E))-1/mm*(E0-e*sin(E0)));
end