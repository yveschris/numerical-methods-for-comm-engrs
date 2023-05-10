function I=adapt_simp(fun,a,b,eps,varargin)
% ����Ӧ����ɭ��ʽ�����ֵ����
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
tol=1;S=T;
while tol>eps
    h=h/2;T1=T/2;
    x=a+(2*(1:N)-1)*h;
    fx = feval(fun,x,varargin{:}); % ���㺯��ֵ
    T1=T1+h*sum(fx);
    I=(4*T1-T)/3;
    tol=abs(I-S);
    N=N*2;T=T1;S=I;
end
