function y = lagrange_interp_v2(xdata,ydata,x)
% Lagrange��ֵ
% ���������
%       ---xdata�������Ľڵ������
%       ---ydata�������Ľڵ�������
%       ---x����Ҫ���в�ֵ�Ľڵ������
% ���������
%       ---y��Lagrange��ֵ������x���ĺ���ֵ
n = length(xdata);
ii = 1:n;
y = 0;
for i = ii
    ij = find(ii~=i);
    y = y + prod(x-xdata(ij)) * ydata(i)/prod(xdata(i)-xdata(ij));
end

