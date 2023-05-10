function [H,y]=househ(x)
% ��������x������Householder�任����H��ʹ��Hx=(*,0,0,...,0)'
% ���������
%      ---x������������
% ���������
%      ---H�������Householder�任����
%      ---y��Householder�任�������
x=x(:);
n=length(x);
M=max(abs(x));
x=x/M;
s=sign(x(1));
if s==0
    s==1;
end
sigma=s*norm(x);
x(1)=x(1)+sigma;
rho=sigma*x(1);
u=x;
H=eye(n)-1/rho*u*u';
y=zeros(n,1);
y(1)=-M*sigma;
