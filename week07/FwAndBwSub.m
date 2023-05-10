function x = FwAndBwSub(L, U, b)
%FWANDBWSUB 此处显示有关此函数的摘要
%   此处显示详细说明
% 解下三角方程组：Ly=b
n=length(b); 
y=zeros(n,1);
y(1)=b(1);
for k=2:n
    y(k)=b(k)-L(k,1:k-1)*y(1:k-1);
end
% 解上三角方程组：Ux=y
x=zeros(n,1); x(n)=y(n)/U(n,n);
for k=n-1:-1:1
    x(k)=(y(k)-U(k,k+1:n)*x(k+1:n))/U(k,k);
end
end

