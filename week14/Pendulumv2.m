clear
%% step 1
% time vector
global l g
l = 0.5; % define the length of the cord
g = 9.81; % gravitational acceleration
blob_r = 0.95/100;

time_step = 0.05;
time_vector = 0:time_step:100;
% initial condition
x0 = [deg2rad(10); 1];

[time_vector2, solution] = ode45(@dynamics_pendulum, time_vector, x0);
theta = solution(:, 1);
% 
% figure(1)
% plot(time_vector2, solution(:, 1), 'r')
% grid
% hold on
% plot(time_vector2, solution(:, 2), 'k')

x_pos = l * sin(theta);
y_pos = 0;
z_pos = -l * cos(theta);

f2 = figure(2);
view(3);

line = [0 0 0; x_pos(1) 0 z_pos(1)]';

ln = plot3(line(1, :), line(2, :), line(3, :), '-g', 'LineWidth', 1);
hold on
% Force a 3D view

[X, Y, Z] = sphere(200);
XYZ = cellfun(@(x) blob_r * x, {X, Y, Z}, 'UniformOutput', false);
[X, Y, Z] = XYZ{:};
X1 = X + x_pos(1);
Y1 = Y;
Z1 = Z + z_pos(1);

s = surf(X1, Y1, Z1); % temporary surface to get the handle
colormap bone
shading interp
lightangle(60, 45)

axis equal
xlim([- l, l])
zlim([- l - blob_r, 0])
ylim([- l, l])

grid on

for i = 1:numel(x_pos)
    
    line = [0 0 0; x_pos(i) 0 z_pos(i)]';        
    set(ln, 'XData', line(1, :), 'YData', line(2, :), 'ZData', line(3, :));    
    set(s, 'XData', X + x_pos(i), 'YData', Y, 'ZData', Z + z_pos(i));
        
    drawnow
    pause(time_step);
end

%% step 2


figure(3)

line = [0 0 0; x_pos(1) 0 z_pos(1)]';

ln = plot3(line(1, :), line(2, :), line(3, :), '-g', 'LineWidth', 1);
hold on
% Force a 3D view

[X, Y, Z] = sphere(200);
XYZ = cellfun(@(x) blob_r * x, {X, Y, Z}, 'UniformOutput', false);
[X, Y, Z] = XYZ{:};
X1 = X + x_pos(1);
Y1 = Y;
Z1 = Z + z_pos(1);

s = surf(X1, Y1, Z1); % temporary surface to get the handle
colormap bone
shading interp
lightangle(60, 45)

M = moviein(15);

% M(loops) = struct('cdata', [], 'colormap', []);
axis equal
xlim([- l, l])
zlim([- l - blob_r, 0])
ylim([- l, l])
loops = numel(x_pos);
% grid on
axis off

for i = 1:loops
    
    line = [0 0 0; x_pos(i) 0 z_pos(i)]';        
    set(ln, 'XData', line(1, :), 'YData', line(2, :), 'ZData', line(3, :));    
    set(s, 'XData', X + x_pos(i), 'YData', Y, 'ZData', Z + z_pos(i));

    drawnow
    view(180, 0)
    M(i) = getframe;
end
figure(4)
axis off
framerate = 1/time_step;
% axis equal
movie(M, 1, framerate);




function dx = dynamics_pendulum(t, x)
global l g
mass = 1; % define the mass of the bob
l = 0.5; % define the length of the cord
g = 9.81; % gravitational acceleration

% define the state-space model
dx = [x(2, 1); -(g / l) * sin(x(1, 1))];
end