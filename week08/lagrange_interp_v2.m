function y = lagrange_interp_v2(xdata,ydata,x)
% Lagrange插值
% 输入参数：
%       ---xdata：给定的节点横坐标
%       ---ydata：给定的节点纵坐标
%       ---x：需要进行插值的节点横坐标
% 输出参数：
%       ---y：Lagrange插值函数在x处的函数值
n = length(xdata);
ii = 1:n;
y = 0;
for i = ii
    ij = find(ii~=i);
    y = y + prod(x-xdata(ij)) * ydata(i)/prod(xdata(i)-xdata(ij));
end

