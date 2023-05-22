function [x,y]=Improved_Euler(odefun,xspan,y0,h,varargin)
% �Ľ�Euler��ʽ��ⳣ΢�ַ���
% ���������
%      ---odefun��΢�ַ��̵ĺ�������
%      ---xspan���������[x0,xn]
%      ---y0����ʼ����
%      ---h����������
%      ---p1,p2,����odefun�����ĸ��Ӳ���
% ���������
%      ---x�����صĽڵ㣬��x=xspan(1):h:xspan(2)
%      ---y��΢�ַ��̵���ֵ��
x=xspan(1):h:xspan(2);
y(1)=y0;
for k=1:length(x)-1
    T=y(k)+h*feval(odefun,x(k),y(k),varargin{:});
    y(k+1)=y(k)+h/2*(feval(odefun,x(k),y(k),varargin{:})+...
        feval(odefun,x(k+1),T,varargin{:}));
end
x=x';y=y';
