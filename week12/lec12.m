%% adapt trape
f=@(x)sin(x)./x;
I=adapt_trape(f, 1, 5)

%% adapt simp
f=@(x)sin(x)./x;
I=adapt_simp(f, 1, 5)

%% adpat cotes
format long
xi = 0.1;
I=adapt_Cotes(@Dampedsinewave,0,20,[],xi)

%% romberg
xi=0.1;
[I,T]=Romberg(@Dampedsinewave,0,20,[],xi)

%% gauss-legendre
format short e
f=@(x)sin(x)./x; % 定义被积函数

syms x
g = sin(x)/x;
exact = double(int(g, 1, 5));

for m=1:6
    I=Gauss_legendre(f,1,5, m); %� Gauss- Legendre 公式求积分
    err(m)=abs(I-exact); % 计算绝对误差
end
err % 显示误差结果

%%

format short e
f=@(x)sin(x)./x; % 定义被积函数

syms x
g = sin(x)/x;
exact = double(int(g, 1, 5));

for m=1:4
    I=Gauss_Lobatto(f, 1, 5, m); % Gauss_Lobatto公式求积
    err(m)=abs(I-exact); % 计算绝对误差
end
err% ?显示误差结果

%%
h=0.0001;
x=[0:h:3*pi/2,3*pi/2];y=cos(15*x);
I = trapz(x, y)% 梯形法求积分

%%

f=@(x)1./(sqrt(x).*(exp(x)+1)); %定义被积函数
I_quad=quad(f, 0,pi) %quad�函数求解定积分

%%

syms t xi alpha;
f=exp(-xi * t) * cos(t*sqrt(1 -xi^2)+alpha)/cos(alpha);
y=subs(f,alpha,atan(-xi/sqrt(1 -xi^2)));
I1=int(y,t,0, 20);
xi=0.1 ;format long
I2=vpa(subs(I1),30)
I=quad(@Dampedsinewave,0,20,[],[],xi)
%解析解
%精确解 %数值解

%%

f=@(x)exp(-x.^2);	%定义被积函数
l_quadgk=quadgk(f,0, inf)	% quadgk 函数求解无穷积分

%%

F=@(x)x.^5.*exp(-x).*sin(x);
[q,errbnd] = quadgk(F, 1,10,'Waypoints',[2 5])

%%

format long
i=sqrt(-1);f=@(x)exp(-x.^2-i*x).*sin((7+2i)*x);	% 定义被积函数
I=quadgk(f,2,6-5i)	%调用quadgk函数求解复数积分问题
syms x;f=exp(-x^2-i*x)*sin((7+2i)*x);
IO=vpa(int(f,2,6-5i)) % 求解析解

%%

syms x;
I_accurate=vpa(int(exp(x)*cos(1000*x),x,0,pi)) % 精确值
f=@(x)exp(x).*cos(1000*x);
l_quad=quad(f,0,pi) % quad 函数求解
I_quadgk=quadgk(f,0,pi,'MaxIntervalCount',1000) % quadgk 函数求解


