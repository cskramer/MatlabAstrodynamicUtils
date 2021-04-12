%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 04.09.15
   ---------------------------------------------------
   This function computes delta time from a two-way light time
   algoithm given:

   rsta: TOD ground site vector at receipt time
   r: TOD satellite position vector at receipt time
   v: TOD satellite velocity vector at receipt time
   xpdr_delay: Transponder delay (seconds)
%}
function [ dtprop ] = lightTimeAlgorithm( rsta, r, v, xpdr_delay )
    
    % Establish constants for our model
    % ----------------------------------------------------
    global c mu w_earth fid;
    
    tolerance = 1e-10;
    difference = 100000;
    
    % First leg
    dtprop = 0;
    last_dt = 0;
    
    rx = r; % Satellite vector at transmit time
    vx = v;
    
    fprintf(fid,'\nIn Light Time Algorithm\n\n');
    fprintf(fid,'Receive Leg\n');
    fprintf(fid,'Step Range(m) PropTime Difference\n');
    step = 1;
    
    while(abs(difference)>tolerance)
        dr = rx - rsta;
        rho = norm(dr);
        dt = rho/c;
        
        difference = dt - last_dt;
        
        last_dt = dt;
        a_cb = centralBodyAcceleration(rx);
        [rx, vx] = simplePropagator(-dt, r, v, a_cb);
        
        fprintf(fid, '%4i %16.3f %16.10f %16.8s\n', step, rho, dt, difference);
        
        step = step + 1;
    end
    
    dtprop_rec = dt + xpdr_delay; % Receive leg and transponder delay
    
    % Not strictly necessary, but propagate back to SV receipt time
    a_cb = centralBodyAcceleration(rx);
    [rr, vr] = simplePropagator(-xpdr_delay, rx, vx, a_cb);
    
    rsta_t = rsta; % Satellite vector at transmit time
    difference = 10000;
    last_dt = 0;
    
    fprintf(fid,'Transmit Leg\n');
    fprintf(fid,'Step Range(m) PropTime Difference\n');
    
    step = 1;
    
    while(abs(difference)>tolerance)
        dr = rr - rsta_t;
        rho = norm(dr);
        dt = rho/c;
        
        difference = dt - last_dt;
        last_dt = dt;
        dtprop = dtprop_rec + dt;
        rotation = -w_earth*dtprop; % We'll be rotating backwards to the transmit time
        R = rotateZ(rotation);
        rsta_t = R*rsta;
        
        fprintf(fid, '%4i %16.3f %16.10f %16.8s\n', step, rho, dt, difference);
        step = step + 1;
    end
    
    % Return 1-way propagation delay (including transponder delay)
    dtprop = (dtprop_rec + xpdr_delay + dt)/2.;
    fprintf(fid, '\nRound-trip Time: %16.10f sec\n', 2*dtprop);
    fprintf(fid, 'Round-trip Range: %16.10f m\n\n', 2*c*dtprop);
    fprintf(fid, '\nOne-way Time: %16.10f sec\n', dtprop);
    fprintf(fid, 'One-way Range: %16.10f m\n\n', c*dtprop);
    
end