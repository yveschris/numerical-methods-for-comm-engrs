function [x,iter,X]=newton_reroot(fun,x0,eps,maxiter)
% Newton������(�ظ�����)�������Է��̵ĸ�
% ���������
%      ---fun����������
%      ---x0����ʼ������
%      ---eps������Ҫ��Ĭ��ֵΪ1e-6
%      ---maxiter��������������Ĭ��ֵΪ1e4
% ���������
%      ---x�������Է��̵Ľ��Ƹ�
%      ---iter����������
%      ---X��ÿһ�������Ľ��
if nargin<2,error('�������������Ҫ2����'),end
if nargin<3|isempty(eps),eps=1e-6;end
if nargin<4|isempty(maxiter),maxiter=1e4;end
k=0;err=1;
while abs(err)>eps
    k=k+1;
    [fx0,dfx0,d2fx0]=feval(fun,x0);
    x1=x0-fx0*dfx0/(dfx0^2-fx0*d2fx0);  % �ظ����ε�����ʽ
    err=x1-x0;  % �������ε���ֵ�Ĳ�ֵ
    x0=x1;  % ����x0
    X(k)=x1;
end
if k==maxiter
    error('�����������ޣ�����ʧ�ܣ�')
end
x=x1;iter=k;X=X';
