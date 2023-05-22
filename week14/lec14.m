%% 显式欧拉法
f=@(x,y)-2 .* x.^ 3 + 12 .* x.^2 - 20 .* x + 8.5;
[t,y]=Explicit_Euler(f,[0,4],1,0.5);  % 利用Euler法求数值解
y1=dsolve('Dy+2*x^3-12*x^2+20*x-8.5=0','y(0)=1','x');  % 求微分方程解析解
fplot(y1,[0,4])  % 绘制解析解图形
hold on  % 图形保持
plot(t,y,'k.-','MarkerSize',20)  % 绘制数值解图形并设置线型、颜色和标记符号
text([1.5,2],[20,8],{'解析解','Euler法求解结果'},...
    'fontname','隶书','fontsize',16)  % 添加标注
ylim([0, 10])


%% 显式欧拉法
f=@(t,y)4*exp(0.8*t)-0.5*y;
[t,y]=Explicit_Euler(f,[0,4],2,0.1);  % 利用Euler法求数值解
y1=dsolve('Dy-4*exp(0.8*t)+0.5*y=0','y(0)=2','t');  % 求微分方程解析解
fplot(y1,[0,4])  % 绘制解析解图形
hold on  % 图形保持
plot(t,y,'k.-','MarkerSize',20)  % 绘制数值解图形并设置线型、颜色和标记符号
text([1.5,2],[20,8],{'解析解','Euler法求解结果'},...
    'fontname','隶书','fontsize',16)  % 添加标注



%% 改进的欧拉法
f=@(t,y)4*exp(0.8*t)-0.5*y;  % 定义微分方程表达式
[t,y]=Improved_Euler(f,[0,4],2,1);  % 改进Euler方法求解微分方程
y1=dsolve('Dy-4*exp(0.8*t)+0.5*y=0','y(0)=2','t');  % 求微分方程的解析解
fplot(y1,[0,4])  % 绘制微分方程解析解的图形
hold on  % 图形保持
plot(t,y,'k.-','MarkerSize',20)  % 绘制数值解的图形
text([2,1],[10,45],{'解析解','梯形公式求解结果'},...
    'fontname','隶书','fontsize',16)  % 添加标注
ylim([0,90])  % 设置y轴的坐标范围

%% 龙格库塔，解多项式
f=@(x,y)-2 .* x.^ 3 + 12 .* x.^2 - 20 .* x + 8.5;
[t,y]=Classical_RK4(f,[0,4],1,0.5);  % 利用Euler法求数值解
y1=dsolve('Dy+2*x^3-12*x^2+20*x-8.5=0','y(0)=1','x');  % 求微分方程解析解
ezplot(y1,[0,4])  % 绘制解析解图形
hold on  % 图形保持
plot(t,y,'k.-','MarkerSize',20)  % 绘制数值解图形并设置线型、颜色和标记符号
text([1.5,2],[20,8],{'解析解','Euler法求解结果'},...
    'fontname','隶书','fontsize',16)  % 添加标注
ylim([0, 10])

%%
f=@(t,y)4*exp(0.8*t)-0.5*y;  % 定义微分方程表达式
[t,y]=Classical_RK4(f,[0,4],2,0.5);  % 利用经典四阶Runge-Kutta法求解微分方程
y1=dsolve('Dy-4*exp(0.8*t)+0.5*y=0','y(0)=2','t');  % 求微分方程的解析解
ezplot(y1,[0,4])  % 绘制解析解的图形
hold on  % 图形保持
plot(t,y,'k.-','MarkerSize',20)  % 绘制数值解
text([2,1],[10,45],{'解析解','经典四阶R-K方法求解结果'},...
    'fontname','隶书','fontsize',16)  % 添加标注

%%

f=@(t,y)[-0.5*y(1);
    4 - 0.3*y(2) - 0.1*y(1)];  % 定义微分方程组
[t,y]=Classical_RK4s(f,[0,2],[4, 6],0.5);  % 利用经典四阶Runge-Kutta求解微分方程组
h=plot(t,y,'LineWidth',2);  % 绘制数值解
set(h(2),'LineStyle','-.')  % 设置线型

%%

f=@(t,y)[y(2);
    -abs(y(1))];  % 定义微分方程组
tspan=[0,4];  % 求解区间
x0f=[0,-2];  % 给定的边值条件
[t,y]=lineshoot(f,f,tspan,x0f)  % 线性打靶法求解
plot(t,y(:,1),'k',t,y(:,2),'-.')  % 绘制求解结果图形
h=legend('{\ity}({\itt})','{\ity''}({\itt})');  % 添加图例
set(h,'fontname','times','fontsize',12)  % 

%%
