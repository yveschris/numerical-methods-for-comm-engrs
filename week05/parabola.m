function [x,iter,X]=parabola(fun,x0,x1,x2,eps,maxiter)
% �����߷��������Է��̵ĸ�
% ���������
%      ---fun����������
%      ---x0,x1,x2����ʼ������
%      ---eps������Ҫ��Ĭ��ֵΪ1e-6
%      ---maxiter��������������Ĭ��ֵΪ1e4
% ���������
%      ---x�������Է��̵Ľ��Ƹ�
%      ---iter����������
%      ---X��ÿһ�������Ľ��
if nargin<4
    error('�������������Ҫ4����')
end
if nargin<5|isempty(eps)
    eps=1e-6;
end
if nargin<6|isempty(maxiter)
    maxiter=1e4;
end
k=0;err=1;
while err>eps
    k=k+1;
    f0 = feval(fun,x0);    % ����x0������ֵ
    f1 = feval(fun,x1);    % ����x1������ֵ
    f2 = feval(fun,x2);    % ����x2������ֵ
    w=(f2-f1)/(x2-x1)+((f2-f1)/(x2-x1)-...
        (f1-f0)/(x1-x0))/(x2-x0)*(x2-x1);
    x3 = x2-2*f2/[w+sign(w)*sqrt(w^2-4*f2*((f2-f1)/(x2-x1)-...
        (f1-f0)/(x1-x0))/(x2-x0))];  % �����߷�������ʽ
    err=abs(x3-x2);
    x0 = x1; % ����x0��ֵ
    x1 = x2; % ����x1��ֵ
    x2 = x3;
    X(k)=x3;
end
if k>=maxiter
    error('�����������ޣ�����ʧ�ܣ�')
end
x=x3;iter=k;X=X';
