A = 10;
global cc
cc =20;
C = add(A);
C1 = add1(A)

function b = add(a)
global cc;
b = a + cc;
end

function b = add1(a)
cc = [];
if isempty(cc)
    cc = 0;
end
cc = cc + 1;
b = a + cc;
end

