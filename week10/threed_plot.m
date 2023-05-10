u = [0 0 3 3 1.75 1.75 2 2 1.75 1.75 3 4 ...
    5.25 5.25 5 5 5.25 5.25 3 3 6 6];
v = [0 .5 .5 .502 .502 .55 .55 1.75 1.75 ...
    2.5 2.5 1.5 1.5 1.4 1.4 ...
    .55 .55 .502 .502 .5 .5 0];
subplot(1, 2, 1)
plot(u, v, 'k')
axis ([-1 7 -1 3]), axis equal, axis off
title('2-D profile')

clf
figure(1)
facets = 200;
t = deg2rad(364);

Rx = [1 0 0; 0 cos(t) -sin(t); 0 sin(t) cos(t)];
Ry = [cos(t) 0 sin(t); 0 1 0; -sin(t) 0 cos(t)];
Rz = [cos(t) -sin(t) 0; sin(t) cos(t) 0; 0 0 1];

[xx tth] = meshgrid( u, linspace(0, 2*pi, facets) );
[rr tt] = meshgrid( v, 1:facets);
yy = rr .* cos(tth);
zz = rr .* sin(tth);

xyz = [xx(:)'; yy(:)'; zz(:)'];

xyzRx = Ry * xyz;
sz = size(xx);
xx1 = reshape(xyzRx(1, :), sz);
yy1 = reshape(xyzRx(2, :), sz);
zz1 = reshape(xyzRx(3, :), sz);

surf(xx1, yy1, zz1);

shading interp
axis square, axis tight, axis off
colormap bone
lightangle(60, 45)
alpha(0.8)
title('rotated object')

