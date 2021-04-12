%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 03.10.15
   ---------------------------------------------------
   This function accepts mu, position and veolocity
   vectors, stepSize and an acceleration model argument 
   (Model1 = Central Body Acceleration, Model2 = central
   body and J2) and utilizes Runge Kutta 4 integration 
   step to return position and vlocity vectors.
%}
function [ r1, v1 ] = RK4Step( JDi, ro, vo, model)

    % Utilize our global constants
    global stepSize;    

    % Performs a single RK4 step 
    ao = acceleration(JDi, ro, vo, model);

    k1r = vo;
    k1v = ao;

    ra = ro + (stepSize/2.)*vo;
    va = vo + (stepSize/2.)*ao;
    JDa = JDi + (stepSize/2.)/86400;
    
    aa = acceleration(JDa, ra, va, model);
    k2r = va;
    k2v = aa;

    rb = ro + (stepSize/2.)*va;
    vb = vo + (stepSize/2.)*aa;
    JDb = JDi + (stepSize/2.)/86400;
    
    ab = acceleration(JDb, rb, vb, model);
    k3r = vb;
    k3v = ab;

    rc = ro + (stepSize)*vb;
    vc = vo + (stepSize)*ab;
    JDc = JDi + (stepSize/2.)/86400;

    ac = acceleration(JDc, rc, vc, model);
    k4r = vc;
    k4v = ac;

    r1 = ro + stepSize*(k1r/6. + k2r/3. + k3r/3. + k4r/6.);
    v1 = vo + stepSize*(k1v/6. + k2v/3. + k3v/3. + k4v/6.);
end



