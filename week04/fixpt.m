function [x,iter,X]=fixpt(g,x0,eps,maxiter)
% �򵥵�����������Է��̵ĸ�
% ���������
%      ---g����������
%      ---x0����ʼ������
%      ---eps������Ҫ��Ĭ��ֵΪ1e-6
%      ---maxiter��������������Ĭ��ֵΪ1e4
% ���������
%      ---x�������Է��̵Ľ��Ƹ�
%      ---iter����������
%      ---X��ÿһ�������Ľ��
if nargin<2,error('�������������Ҫ3����'),end
if nargin<3|isempty(eps),eps=1e-6;end
if nargin<4|isempty(maxiter),maxiter=1e4;end
err=1;k=0;
while err>eps
    k=k+1;
    x1=feval(g,x0);  % ����
    err=abs(x1-x0);  % �������ε����
    x0=x1;  % ����
    X(k)=x1;
end
if k==maxiter
    error('�����������ޣ�����ʧ�ܣ�')
end
x=x1;iter=k;X=X';
