function [y,D]=newton_interp(xdata,ydata,x)
% Newton��ֵ
% ���������
%       ---xdata�������Ľڵ������
%       ---ydata�������Ľڵ�������
%       ---x����Ҫ���в�ֵ�Ľڵ������
% ���������
%       ---y��Newton��ֵ������x���ĺ���ֵ
%       ---D�����̱�

n = length(xdata);
D=zeros(n);
D(:,1)=ydata';
H=1;

for j=1:n-1
    for k=1:n-j
        D(k,j+1)=(D(k+1,j)-D(k,j))/(xdata(j+k)-xdata(k));
    end
    H=H.*(x-xdata(j));
    L(j)=H;
end
L=[1 L];
y=L * D(1,:)';
