%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 04.12.15
   ---------------------------------------------------
   This function is an RK4 wrapper used to determine min
   and max azimuth values. It is typicaly called during 
   another RK4 propogation to interpolate az values. If 
   mode =0, the azimuth and elevation are returned when
   elevation is closest to 0 (rise and set). If mode =1
   the azimuth and elevation are returned at the highest
   elevation point. 
%}
function [finalt, azValue, elValue] = AzElRK4Retriever( time, JD, r, v, model, sSize, steps, mode)

    % Establish constants for our model
    % ----------------------------------------------------
    global GSlatd;
    global GSlond;
    global GSalt;
    global d2r;

    GHA = greenwichHourAngle(JD);
    GHA = mod(GHA, 2*pi);

    % Compute transformation matrix R corresponding to GHA
    R = rotateZ(GHA);

    r_ecef = R*r;

    POGOLatr = GSlatd*d2r;
    POGOLonr = GSlond*d2r;

    [xb, yb, zb] = siteVector(POGOLatr, POGOLonr, GSalt);
    r_site = [xb; yb; zb];

    r_rel = r_ecef - r_site;

    % ECEF to Topodetic Transformation
    T = topodetic(POGOLatr, POGOLonr, GSalt);

    % Propagation params/setup
    JD0 = JD;
    r0 = r;
    v0 = v;
    t = time; % Initial time

    [az, el] = azimuthElevation(r_rel, T);
    
    elPrevious = el;
    azValue = az;
    azPrevious = az;
    complete = 0;

    % Propagate vehicle 1
    for i=1:1:steps 
        [r1, v1] = RK4Step(JD0, r0, v0, model);
        
        t = t-sSize;
        JD1 = JD0 - (sSize/86400.);
    
        % Compute GHA at epoch
        GHA = greenwichHourAngle(JD1);
        GHA = mod(GHA, 2*pi);
    
        % Compute transformation matrix corresponding to GHA
        R = rotateZ(GHA); 
     
        r_ecef = R*r1;
    
        r_rel = r_ecef - r_site;
    
        [az, el] = azimuthElevation(r_rel, T);
        
        % Get azimuth at rise and set (elevation = 0)
        if mode == 0 
             if (sign(el) == 1) && (sign(elPrevious) == -1) && (complete == 0) ...
                    || (sign(el) == -1) && (sign(elPrevious) == 1) && (complete == 0)
                if (abs(az) < abs(azPrevious))
                    azValue = az;
                    elValue = el;
                    finalt = t;
                end
                if (abs(az) >= abs(azPrevious))
                    azValue = azPrevious;
                    elValue = elPrevious;
                    finalt = t-sSize;
                end
                complete = 1;
             end
        end
        
        if mode == 1 % Get azimuth at highest elevation
            if (el < elPrevious) && (complete == 0)
                azValue = azPrevious;
                elValue = elPrevious;
                complete = 1;
                finalt=t;
            end
        end
    
        % Set for next step
        r0 = r1;
        v0 = v1;
        JD0 = JD1; % Increment Julian date
        elPrevious = el;
    end