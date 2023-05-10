function b- fzerosiip(x1,xu)
a!xl; b = xu; fa = f(a); fb!f(b);
c = a; fc = fa; d = b- c; e = d;
while (lj
if fb= 0, break, end
if sign(fa)= sign(fb)Hf needed, rearrange points
a = c; fa = fc; d = b- c; e = d;
end
if abs(fa) < abs(fb)
c = b; b = a; a = c;
fc = fb; fb = fa; fa = fc;
end
n = 0.5'(a- b); Gemination test and possible exit
tol = 2* eps * nax(abs(b), 1);
if abs(n) <= tol|fb= 0.
break
end
XChoose open methods or bisection
if abs(e)*tol & abs(fc) > abs(fb)
s = fb/fc;
if a= c
tot method
p = 2Vs;
q = 1- s;
else
quadratic interpolation
q = fc/fa; r = fb/fa;
p = s *(2Vq *(q - r)-(b - c)*(r- 1));
q * (q
■ i)*(r
■ i)*(s * l);
end
if p > 0, q = -q; else p = -p; end;
if 2*p < 3*m‘q•abs(tol*q)l p < abs(0.5*e*q)
e = d; d = p/q;
else
d = i;e ■
end
else
bisection
d = i; e = ■;
end
c = b; fc = fb;
if abs(d) > tol, b=b+d; else b=b-sign(b-a)*tol; end
fb = f(b);
end