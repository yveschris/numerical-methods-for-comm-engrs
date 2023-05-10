function D=QR_basicv2(A)
[m,n]=size(A);
if m~=n
    error('A±ØÐëÎª·½Õó£¡')
end
A=Hessenberg(A);
err=1;
while err>1e-5 
    [q1,r1]=qr(A); 
    A1=r1*q1; 
    [q2,r2]=qr(A1); 
    A2=r2*q2; 
    err=norm(diag(A1-A2));
    A=A2;
end 
D=diag(A2);