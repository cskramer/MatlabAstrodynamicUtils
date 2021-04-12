
%# some random data
K = 3;
N = 30;
data = zeros(K,N);
data(1,:) = 0.2*randn(1,N) + 1;
data(2,:) = 0.2*randn(1,N) + 2;
data(3,:) = 0.2*randn(1,N) + 3;

center = [0 0];                        %# center (shift)
radius = [data data(:,1)];             %# added first to last to create closed loop
radius = normalize(radius',1)'+1;      %# normalize data to [0,1] range

figure, hold on

%# draw outer circle
theta = linspace(5*pi/2, pi/2, 500)';  %# 'angles
r = max(radius(:));                    %# radius
x = r*cos(theta)+center(1);
y = r*sin(theta)+center(2);
plot(x, y, 'k:');

%# draw mid-circles
theta = linspace(5*pi/2, pi/2, 500)';  %# 'angles
num = 5;                               %# number of circles
rr = linspace(0,2,num+2);              %# radiuses
for k=1:num
    r = rr(k+1);
    x = r*cos(theta)+center(1);
    y = r*sin(theta)+center(2);
    plot(x, y, 'k:');
end

%# draw labels
theta = linspace(5*pi/2, pi/2, N+1)';    %# 'angles
theta(end) = [];
r = max(radius(:));
r = r + r*0.2;                           %# shift to outside a bit
x = r*cos(theta)+center(1);
y = r*sin(theta)+center(2);
str = strcat(num2str((1:N)','%d'),{});   %# 'labels
text(x, y, str, 'FontWeight','Bold');

%# draw the actual series
theta = linspace(5*pi/2, pi/2, N+1);
x = bsxfun(@times, radius, cos(theta)+center(1))';
y = bsxfun(@times, radius, sin(theta)+center(2))';
h = zeros(1,K);
clr = hsv(K);
for k=1:K
    h(k) = plot(x(:,k), y(:,k), '.-', 'Color', clr(k,:), 'LineWidth', 2);
end

%# legend and fix axes
legend(h, {'M1' 'M2' 'M3'}, 'location', 'SouthOutside', 'orientation','horizontal')
hold off
axis equal, axis([-1 1 -1 1] * r), axis off