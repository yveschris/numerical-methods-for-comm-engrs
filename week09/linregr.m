function a = linregr(x,y)
% linregr: linear regression curve fitting
%    [a, r2] = linregr(x,y): Least squares fit of straight 
%              line to data by solving the normal equations
% input:
%    x = independent variable
%    y = dependent variable
% output:
%    a = vector of slope, a(1), and intercept, a(2)
%    r2 = coefficient of determination
n = length(x);
if length(y) ~= n, error('x and y must be same length'); end
x = x(:); y = y(:);     % convert to column vectors
sx = sum(x); sy = sum(y);
sx2 = sum(x.*x); sxy = sum(x.*y); 
a(1) = (n*sxy - sx*sy)/(n*sx2 - sx^2);
a(2) = sy/n - a(1)*sx/n;
