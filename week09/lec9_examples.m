%%
x = [1 2 3 2 1.2 2 2.7]; y = [1 0 1 2.5 3.4 4 3.2];
n = length(x);
t = 0:1:n-1;
tt = 0:.01:n-1; % Finer mesh to sample spline
xx = spline(t,x,tt); yy = spline(t,y,tt); hold on
plot(xx,yy','LineWidth',2), plot(x,y,'o'), grid on
% comet(xx,yy)


x = [3 1.75 0.90 0 0.50 1.50 3.25 4.25 4.25 3 3.75 6.00];
y = [4 1.60 0.50 0 1.00 0.50 0.50 2.25 4.00 4 3.25 4.25];
n = length(x);
t = 0:1:n-1;
tt = 0:.01:n-1; % Finer mesh to sample spline
xx = spline(t,x,tt); yy = spline(t,y,tt); hold on
plot(xx,yy','LineWidth',2), plot(x,y,'o'), grid on
% comet(xx,yy)


%%

x = 1:7;
y = [0.5 2.5 2 4 3.5 6 5.5];
p = polyfit(x,y,1); 
f = polyval(p, x);
plot(x, y, 'o', x, f, '-')
legend('data','linear fit') 
xlim([1, 7])
ylim([0, 20])

%%

x = 1:7;
y = [0.5 2.5 2 4 3.5 6 5.5];
a = linregr(x,y)


%%
x = [0 2 2.5 1 4 7]';
y = [0 1 2 3 6 2]';
z = [5 10 9 0 3 27]';
M = [x y ones(size(x))]; % 构造矩阵 M
X = lsqlin(M, z); % 求解二元线性拟合问题
[xx,yy] = meshgrid(x,y);
z1 = X(1) * xx + X(2) * yy + X(3);
mesh(xx,yy,z1) % 绘制网格曲面图
hold on % 图形保持
plot3(x,y,z,'ko') % 绘制数据点
alpha(0.6) % 设置透视程度

%% 课件
x = [0 2 2.5 1 4 7]';
y = [0 1 2 3 6 2]';
z = [5 10 9 0 3 27];
M = [x y ones(size(x))]; % 构造矩阵 M
X = lsqlin(M, z); % 求解二元线性拟合问题
[xx,yy] = meshgrid(x,y);
z1 = X(1) * xx + X(2) * yy + X(3);
mesh(xx,yy,z1) % 绘制网格曲面图
hold on % 图形保持
plot3(x,y,z,'ko') % 绘制数据点
alpha(0.6) % 设置透视程度

%%

reactants =[470 285 470 470 470 100 100 470 100 100 100 285 285;
    300 80 300 80 80 190 80 190 300 300 80 300 190;
    10 10 120 120 10 10 65 65 54 120 120 10 120]';
rate = [8.55 3.79 4.82 0.02 2.75 14.39 2.54 4.35 13 8.5 0.05 11.32 3.13]';
f = @(b, x)(b(1)*x(:,2) - x(:,3)/b(5))./ (1+b(2)*x(:, 1)+b(3)*x(:,2)+b(4)*x(:,3));
b0=[1;0.1;0.2;0.1;2];
betafit = nlinfit(reactants, rate, f, b0)

fb = @(x)f(betafit, x);
plot(1:numel(rate), rate);
hold on
plot(1:numel(rate), f(betafit, reactants));


%%

phi0 = @(x) x.^0;
phi1 = @(x) x.^1;
func = @(x) sqrt(1 + x .^ 2);
 

d0 = quad(@(x) func(x) .* phi0(x), 0, 1);
d1 = quad(@(x) func(x) .* phi1(x), 0, 1);
 
d = [d0 d1]'; 
B = hilb(2);
 
a = invhilb(2) * d;
x = 0:0.01:1;
plot(x, func(x));
hold on
plot(x, polyval(fliplr(a'), x)); grid on

%%

wfun='x.^0';  % 权函数
phifun=char('1','x','x.^2','x.^3');  % 基函数
fun='exp(x)';  % 被逼近函数
a=-1;b=1;  % 区间端点
[A,B,p]=lsapprox(wfun,phifun,fun,a,b);  % 求解三次最佳平方逼近多项式系数
p2=poly2str(fliplr(p),'x')

x = a:0.01:b;
plot(x, exp(x));
hold on
plot(x, polyval(fliplr(p), x)); grid on



%%

x = [0:0.5:3]';
y = [0 0.4794 0.8415 0.9815 0.9126 0.5985 0.1645]';
Z = [ones(size(x)) x x.^2 cos(x) exp(x) sin(x)];
Z'*Z;
a = (Z'*Z)\(Z'*y)

xx = [0:0.01:3]';
Zx = [ones(size(xx)) xx xx.^2 cos(xx) exp(xx) sin(xx)];
Yx = Zx * a;

plot(x, y, 'o');
hold on
plot(xx, Yx);

%%

x = -1:0.01:1;
fx = exp(x);
sx = polyval(fliplr(p), x);
figure(1)
plot(x, fx)
hold on
plot(x, sx)

%%
% based on https://www3.nd.edu/~nancy/Math30650/Matlab/Demos/fourier_series/fourier_series.html
 
syms x k L n
evalin(symengine,'assume(k,Type::Integer)');
a = @(f,x,k,L) int(f*cos(k*pi*x/L)/L,x,-L,L);
 
b = @(f,x,k,L) int(f*sin(k*pi*x/L)/L,x,-L,L);
 
fs = @(f,x,n,L) a(f,x,0,L)/2 + ...
    symsum(a(f,x,k,L)*cos(k*pi*x/L) + b(f,x,k,L)*sin(k*pi*x/L),k,1,n);
 
f = abs(x)
 
fplot(fs(f,x,10,1),[-1,1])
hold on
fplot(f,[-1,1])
hold off
title('Partial sum with n=2')


