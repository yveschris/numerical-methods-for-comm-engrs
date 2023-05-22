function [x,y]=Explicit_Euler(odefun,xspan,y0,h,varargin)
% ��ʽEuler��ʽ��ⳣ΢�ַ���
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
y = zeros(1, length(x));
y(1)=y0;
for k=1:length(x)-1
    y(k+1)=y(k)+h*feval(odefun,x(k),y(k),varargin{:});
end
x=x';y=y';
