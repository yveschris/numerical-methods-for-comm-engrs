function [I,T]=Romberg(fun,a,b,eps,varargin)
% Romberg��ʽ�����ֵ����
% ���������
%      ---fun����������
%      ---a,b����������Ķ˵�
%      ---eps������Ҫ��Ĭ��ֵΪ1e-6
%      ---p1,p2,...��fun�ĸ��Ӳ���
% ���������
%      ---I����õĻ���ֵ
%      ---T��Romberg���ֹ��̲�������������
if nargin<4|isempty(eps);
    eps=1e-6;
end
N=1;h=b-a;
T(1,1)=h/2*sum(feval(fun,[a,b],varargin{:}));
tol=1;
while tol>eps
    h=h/2;N=2*N;k=log2(N);
    x=a+(2*(1:N/2)-1)*h;
    fx = feval(fun,x,varargin{:}); % ���㺯��ֵ
    T(k+1,1)=1/2*T(k,1)+h*sum(fx);
    for j=1:k
        T(k+1,j+1)=(4^j*T(k+1,j)-T(k,j))/(4^j-1);
    end
    tol=abs(T(k+1,k+1)-T(k,k));
end
I=T(k+1,k+1);
