function I=adapt_Cotes(fun,a,b,eps,varargin)
% ����ӦCotes��ʽ�����ֵ����
% ���������
%      ---fun����������
%      ---a,b����������Ķ˵�
%      ---eps������Ҫ��Ĭ��ֵΪ1e-6
%      ---p1,p2,...��fun�ĸ��Ӳ���
% ���������
%      ---I����õĻ���ֵ
if nargin<4|isempty(eps);
    eps=1e-6;
end
N=1;h=b-a;
T=h/2*sum(feval(fun,[a,b],varargin{:}));
tol=1;C=T;
while tol>eps
    h=h/2;T1=T/2;
    x=a+(2*(1:N)-1)*h;
    fx = feval(fun,x,varargin{:}); % ���㺯��ֵ
    T1=T1+h*sum(fx);
    T2=(4*T1-T)/3;
    I=(16*T2-T1)/15;
    tol=abs(I-C);
    N=N*2;T=T1;T1=T2;C=I;
end
