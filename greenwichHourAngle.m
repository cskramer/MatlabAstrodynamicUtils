%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 04.09.15
   ---------------------------------------------------
   This function computes the Greenwich Hour Angle from a
   Julian Date input (corresponding to tau from equation).
%}
function [ GHA ] = greenwichHourAngle( JD )

    % Establish constants for our model
    % ----------------------------------------------------
    global w_earth;

    JD2000 = 2451545.000000;

    tau = (JD - JD2000)*86400.;

    Tu = (floor(tau/86400+0.5)-0.5)/36525.0; % Julian centuries from J2000

    t = tau - Tu*36525*86400.;
    GHA = t*w_earth + (24110.54841 + 8640184.812866*Tu ...
        + 0.093104*Tu^2-6.2e-6*Tu^3)*(2*pi/86400.);

end

