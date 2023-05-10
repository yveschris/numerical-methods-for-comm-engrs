%%
xdata = [1 4 6];
ydata = [0 1.386294 1.791760];
x = 2;

yl2 = lagrange_interp_v2(xdata, ydata, x);

figure
plot(xdata, ydata, 'o', x,  yl2, ':.');

%%
xdata = [-5 -1 0 2];
ydata = [-2 6 1 3];
x = 1;

% xdata = [1 4 6 5];
% ydata = [0 1.386294 1.791760 1.609438];
% x = 2;

[yn,D] = newton_interp(xdata,ydata,x);

%%

xdata = [0 1 3];
ydata = [2 4 5];
ydot = [1 -1 -2];
x = 2;
yh = hermite_interp(xdata,ydata,ydot,x);