a = -10;
b = 10;
x = linspace(a,b,7); 
f = @(x) 1./(1+exp(-x));
df = @(x) f(x).*(1-f(x));
t = linspace(a,b,50);
r = f(t);
p = pchip(x,f(x),t);
s = spline(x,f(x),t);
q = pchipd(x,f(x),df(x),t);
plot(t,r,'k',x,f(x),'o',t,p,'-',t,s,'-.',t,q,'--')
legend('true','data','pchip','spline','pchipd')

%%

% computation of coefficients of cubic Hermite interpolants from a set [x,y]
x = 0:0.125:1;  % data partition
y = cos(10*pi*x);  % function values
s = -10*pi*sin(10*pi*x);  % slope values
n = length(x)-1;
h = x(2:n+1)-x(1:n); % vector of step sizes of the partition of x
a = y(1:n);
b = s(1:n);
c = ((y(2:n+1)-y(1:n))./h(1:n)-s(1:n))./h(1:n);
d = (s(2:n+1)+s(1:n)-2*(y(2:n+1)-y(1:n))./h(1:n))./(h(1:n).^2);
% evaluation of cubic Hermite interpolants at data points xInt
xInt = 0 : 0.01 : 1; % another partition with better resolution
for j = 1 : length(xInt)
    if xInt(j) ~= x(n+1)
        iInt(j) = sum(x <= xInt(j));
    else
        iInt(j) = n;
    end
end
yInt = a(iInt) + b(iInt).*(xInt-x(iInt)) + c(iInt).*(xInt - x(iInt)).^2 + d(iInt).*(xInt - x(iInt)).^2.*(xIntx(iInt+1));
yEx = cos(10*pi*xInt);
plot(x,y,'b*',xInt,yInt,'g',xInt,yEx,'r:');

%%

%%  双重循环矩形法积分
clear;
dx=0.01;
dy=dx; %设定步长
m=1;
for y=-1:dy:1-dy
    f(m)=0;
    for x=-1:dx:1-dx,
        f(m)=f(m)+dx*exp(-x.^2-y.^2)/pi;
        %对于每个ym值求f(x,ym)对x积分
    end
    m=m+1;
end
S=sum(f)*dy

%%
clear
dx=0.01;
dy=0.01;
x=[-1:dx:1];
y=[-1:dy:1];
[X,Y]=meshgrid(x,y);
%得到自变量数组
F=exp(-X.^2-Y.^2)/pi;
%计算所有f(x,y)点的函数值
S=trapz(trapz(F)*dy)*dx



