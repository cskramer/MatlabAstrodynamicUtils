%{
   Author: Shane Kramer
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 01.31.15
   ---------------------------------------------------
   Energy function.
%}
function en = totalEnergy(rtinorm, vti)
    global mu 
    en = dot(vti,vti)/2 - mu/rtinorm;
end
