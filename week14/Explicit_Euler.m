function [x,y]=Explicit_Euler(odefun,xspan,y0,h,varargin)
% 显式Euler公式求解常微分方程
% 输入参数：
%      ---odefun：微分方程的函数描述
%      ---xspan：求解区间[x0,xn]
%      ---y0：初始条件
%      ---h：迭代步长
%      ---p1,p2,…：odefun函数的附加参数
% 输出参数：
%      ---x：返回的节点，即x=xspan(1):h:xspan(2)
%      ---y：微分方程的数值解
x=xspan(1):h:xspan(2);
y = zeros(1, length(x));
y(1)=y0;
for k=1:length(x)-1
    y(k+1)=y(k)+h*feval(odefun,x(k),y(k),varargin{:});
end
x=x';y=y';
