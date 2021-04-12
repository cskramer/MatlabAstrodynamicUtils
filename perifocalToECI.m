%{
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 02.13.15
   ---------------------------------------------------
   Perifocal to ECI transformation
   Input angles are in radians
%}

function [ T ] = PerifocalToECI( i, O, wp)
  T = [cos(O)*cos(wp)-sin(O)*sin(wp)*cos(i) -cos(O)*sin(wp)-sin(O)*cos(wp)*cos(i) sin(O)*sin(i);
  sin(O)*cos(wp)+cos(O)*sin(wp)*cos(i) -sin(O)*sin(wp)+cos(O)*cos(wp)*cos(i) -cos(O)*sin(i);
  sin(i)*sin(wp) sin(i)*cos(wp) cos(i)];
end
