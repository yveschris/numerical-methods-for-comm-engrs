function [x,fx,iter,X]=test_bit(fun,a,b,eps,varargin)
% ��λ���������Է��̵ĸ�
% ���������
%      ---fun����������̵ĺ�������
%      ---a,b����ʼ����Ķ˵�
%      ---eps������Ҫ��Ĭ��ֵΪ1e-6
%      ---p1,p2,...������������Ӳ���
% ���������
%      ---x�������Է��̵Ľ��Ƹ�
%      ---fx����x���ĺ���ֵ
%      ---iter����������
%      ---X��ÿһ�������Ľ��
if nargin<3,error('�������������Ҫ3����'),end
if nargin<4|isempty(eps),eps=1e-6;end
fa=feval(fun,a,varargin{:});fb=feval(fun,b,varargin{:});
% fa=fun(a,varargin{:});fb=fun(b,varargin{:});
k=1;
if fa*fb>0
    warning(['����[',num2str(a),',',num2str(b),']�ڿ���û�и�']);
elseif fa==0
    x=a;fx=fa;
elseif fb==0
    x=b;fx=fb;
else
    while abs(b-a)>eps;  % ������λ����������
        x=b-(b-a)/(fb-fa)*fb;
        fx = feval(fun,x,varargin{:}); % ����x���ĺ���ֵ
        if fa*fx>0;  % ����
            a = x;   % �˵����
            fa = fx;  % �˵㺯��ֵ����
        elseif fb*fx>0;  % ����
            b = x;  % �˵����
            fb = fx;  % �˵㺯��ֵ����
        else
            break
        end
        X(k)=x;k=k+1;
    end
end
iter=k;