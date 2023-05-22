function [x,y]=Implicit_Euler(odefun,xspan,y0,h,varargin)
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
y(1)=y0;
for k=1:length(x)-1
    z0=y(k)+h*feval(odefun,x(k),y(k),varargin{:});
    z1=inf;
    while abs(z1-z0)>1e-4
        z1=y(k)+h*feval(odefun,x(k+1),z0,varargin{:});
        z0=z1;
    end
    y(k+1)=z1;
end
x=x';y=y';
