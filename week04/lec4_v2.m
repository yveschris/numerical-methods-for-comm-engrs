f = @(x)(668.06 * ...
    (1 - exp(-0.146843 .* x)) ...
    ./ x - 40);

xr = bisect(f, 12, 16);

function xr = bisect(f, xl, xu)
% xl = 12;
% xu = 16;
xmid = ...
    (xl + xu) / 2;
x0 = xmid;
delta = 1;

while delta > 1e-8
    
    if f(xl) * f(xmid) < 0
        xu = xmid;
    else
        xl = xmid;
    end
    
    xmid = (xl + xu) / 2;
    delta = abs((xmid ...
        - x0) / xmid);
    x0 = xmid;
end

xr = xmid;
end
