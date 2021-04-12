%{
   Author: Shane Kramer/Professor Edward Brown (UCCS)
   Course: SPCE 5025 Fundamentals Of Astronautics
   Date: 03.07.15
   ---------------------------------------------------
   This function computes a geopotential acceleration
   model for an ECEF vector(r)
%}
function [ a_geopot ] = geopotentialAcceleration()

% Establish constants for our model
% ----------------------------------------------------
global fid r Re mu;

%Initialize our geoPotential vecotor (returned in function)
a_geopot=[0; 0; 0];

% Create our Gravity coefficient containers
Cnm = zeros(4,5);
Snm = zeros(4,5);

%{
   Load our gravitational C and S terms
   Unfortunately MATLAB does not allow a zero index. The m index is 1+ the
   actual index. We can use the natural index for the Cs.
%}
Cnm(2,1)= -1.082626683553e-03; %20
Cnm(2,2)= -2.414410466885e-10; %21
Cnm(2,3)= 1.574460374564e-06; %22
Cnm(3,1)= 2.532656485332e-06; %30
Cnm(3,2)= 2.192638529169e-06; %31
Cnm(3,3)= 3.089892068805e-07; %32
Cnm(3,4)= 1.005487780644e-07; %33
Cnm(4,1)= 1.619621591367e-06; %40
Cnm(4,2)= -5.087993604038e-07; %41
Cnm(4,3)= 7.841758598438e-08; %42
Cnm(4,4)= 5.920994026291e-08; %43
Cnm(4,5)= -3.984074117663e-09; %44

Snm(2,1)= 0.000000000000e+00; %20
Snm(2,2)= 1.543123211444e-09; %21
Snm(2,3)= -9.038038066386e-07; %22
Snm(3,1)= 0.000000000000e+00; %30
Snm(3,2)= 2.684248902968e-07; %31
Snm(3,3)= -2.114376124373e-07; %32
Snm(3,4)= 1.972225590059e-07; %33
Snm(4,1)= 0.000000000000e+00; %40
Snm(4,2)= -4.491448728393e-07; %41
Snm(4,3)= 1.481778682956e-07; %42
Snm(4,4)= -1.200776676336e-08; %43
Snm(4,5)= 6.525714253704e-09; %44

% Calculate geocentric latitude and longitude
% ----------------------------------------------------
rnorm = norm(r);
sinphi = (r(3)/rnorm);
phi = asin(sinphi);
cosphi = cos(phi);
tanphi = sinphi/cosphi;

lambda = atan2(r(2),r(1));

if(lambda<0)
    lambda = lambda + 2*pi;
end

fprintf(fid, 'Geocentric latitude (phi): %11.6f deg\n',phi*180/pi);
fprintf(fid, 'Geocentric longitude (lambda): %11.6f deg\n',lambda*180/pi);

% define the recursive relationships for cos(m*lambda) and sin(m*lambda)
% ----------------------------------------------------
cm = zeros(5);
sm = zeros(5);
mtan = zeros(5);

%{
  Array elements are off by one: m=0 corresponds to array element 1
  Need to keep that straight
%}
cm(1) = 1;
sm(1) = 0;
mtan(1) = 0;

for m=1:1:4
    cm(m+1) = cos(m*lambda);
    sm(m+1) = sin(m*lambda);
    mtan(m+1) = ((m-1)*tanphi)+tanphi;
end

% Establish Legendre polynomials, in a 5x5 matrix (0...4)
% ----------------------------------------------------
P = zeros(5,6); % All the m=6 terms are zero....
P(1,1)=1; % P00
P(2,1)=sinphi; %P10
P(2,2)=cosphi; %P11

for n=2:1:4
    P(n+1,1)=((2*n-1)*sinphi*P(n,1)-(n-1)*P(n-1,1))/n;
    for m=1:1:n
        if(m<n)
            P(n+1,m+1)=P(n-1,m+1)+(2*n-1)*cosphi*P(n,m);
        end
        
        if(m==n)
            P(n+1,m+1)=(2*n-1)*cosphi*P(n,m);
        end
    end
end

fprintf(fid,'\n');

for n=0:1:4
    for m=0:1:n
        fprintf(fid, 'P(%1i,%1i) = %16.8f\n',n, m, P(n+1,m+1));
    end
end

% Do the summations for the partial derivatives
% ----------------------------------------------------
dpsidr = 0;
dpsidphi = 0;
dpsidlambda = 0;
ratio=Re/rnorm;

for n=2:1:4
    ratio_n = ratio^n;
    msumr = 0;
    msumphi = 0;
    msumlambda = 0;
    
    for m=0:1:n
        X = (Cnm(n,m+1)*cm(m+1) + Snm(n,m+1)*sm(m+1));
        msumr = msumr + X*P(n+1,m+1);
        msumphi = msumphi + X*(P(n+1,m+2)-mtan(m+1)*P(n+1,m+1));
        msumlambda = msumlambda + m*(Snm(n,m+1)*cm(m+1)-Cnm(n,m+1)*sm(m+1))*P(n+1,m+1);
    end
    
    dpsidr = dpsidr + (n+1)*ratio_n * msumr;
    dpsidphi = dpsidphi + ratio_n * msumphi;
    dpsidlambda = dpsidlambda + ratio_n * msumlambda;
end

% Now apply the mu/r factors
dpsidr = dpsidr * -1/rnorm*mu/rnorm;
dpsidphi = dpsidphi * mu/rnorm;
dpsidlambda = dpsidlambda * mu/rnorm;

fprintf(fid,'\nPartial Derivatives\n');
fprintf(fid,'dpsi_dr: %16.8f\n',dpsidr);
fprintf(fid,'dpsi_dphi: %16.8f\n',dpsidphi);
fprintf(fid,'dpsi_dlambda: %16.8f\n',dpsidlambda);

% Now build the gravity acceleration
xy = (r(1)^2 + r(2)^2);
sxy = sqrt(xy);

a_geopot(1) = (1/rnorm*dpsidr - r(3)/(rnorm^2*sxy)*dpsidphi)*r(1) ...
    - 1/xy*dpsidlambda*r(2);

a_geopot(2) = (1/rnorm*dpsidr - r(3)/(rnorm^2*sxy)*dpsidphi)*r(2) ...
    + 1/xy*dpsidlambda*r(1);

a_geopot(3) = 1/rnorm*dpsidr*r(3) + sxy/rnorm^2*dpsidphi;
end

