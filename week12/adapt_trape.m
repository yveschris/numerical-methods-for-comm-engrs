function I=adapt_trape(fun,a,b,eps,varargin)
% ����Ӧ���ι�ʽ�����ֵ����
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
tol=1;
while tol>eps
    h=h/2;I=T/2;
    x=a+(2*(1:N)-1)*h;
    fx = feval(fun,x,varargin{:}); % ���㺯��ֵ
    I=I+h*sum(fx);
    tol=abs(I-T);
    N=N*2; T=I;
end
