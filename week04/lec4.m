%% 
figure(1)
x = 0:0.001:5;
y = 5 .* x .^ 2 - 20 .* x + 10;
plot(x, y)
grid on

%%
figure(2)
x = 0:0.001:1;
y = exp(-x) - x;
plot(x, y)
grid on

%%
figure(3)
x = 4:0.001:20;
y = 668.06 * (1 - exp(-0.146843 .* x)) ./ x - 40;
plot(x, y)
grid on;
grid minor

%%
f = @(x)(668.06 * (1 - exp(-0.146843 .* x)) ./ x - 40);
f(4)
f(8)
f(12)
f(16)
f(20)

%% 

x = 0:0.001:6;
y = (x-2).^2 .* (x - 4);
plot(x, y);
grid on

%%

figure(4)
x = 0:0.001:5;
y = sin(10 .* x) + cos(3 .* x);
plot(x, y)
grid on;
grid minor

%%
f = @(x)(668.06 * (1 - exp(-0.146843 .* x)) ./ x - 40);
f(14.7802)
f(12)*f(14)

%% feval
fun1='mean';
feval(fun1, [1 2])

funstr='@(x)(x * exp(x) - 10)';
fh = str2func(funstr);
feval(fh, 20)

%%

f = @(x)(668.06 * (1 - exp(-0.146843 .* x)) ./ x - 40);

[x,fx,iter,X, ea] = bisect(f, 4, 20, 0.0001);


%%
f = @(x)(exp(-x) - x);
g = @(x)(exp(-x));
tic
[x,fx,iter,X, ea] = bisect(f, 0, 1, 0.001);
iter
toc

tic
[x,fx,iter,X, ea] = false_pos(f, 0, 1, 0.001);
iter
toc

tic
[x,iter,X] = fixpt(g, 0, 0.001, 100);
% iter
toc

%% 定点法

et = [100.0
76.3
35.1
22.1
11.8
6.89
3.83
2.20
1.24
0.705
0.399];

et(2:end) ./ et(1:end-1)

% semilogy(et)

%% 定点法演示
g = @(x)(exp(-x));
[x,iter,X] = fixpt(g, 0, 0.00001, 100);
;

%% 这是局部函数
function [x,fx,iter,X, ea]=bisect(fun,a,b,eps)
% 二分法求解非线性方程的根
% 输入参数：
%      ---fun：待求根方程的函数描述
%      ---a,b：初始区间的端点
%      ---eps：精度要求，默认值为1e-6
%      ---p1,p2,...：求根函数附加参数
% 输出参数：
%      ---x：非线性方程的近似根
%      ---fx：根x处的函数值
%      ---iter：迭代次数
%      ---X：每一步迭代的结果
if nargin<3
    error('输入参数至少需要3个！');
end

if nargin<4 | isempty(eps)
    eps=1e-6;
end

fa = fun(a);
fb = fun(b);
% fa=fun(a,varargin{:});fb=fun(b,varargin{:});
k=1;
if fa*fb>0  % 不满足二分法使用条件
    warning(['区间[',num2str(a),',',num2str(b),']内可能没有根']);
elseif fa==0  % 区间左端点为根
    x=a;fx=fa;
elseif fb==0  % 区间右端点为根
    x=b;fx=fb;
else
    
%     xold = a;
    x = (a + b) / 2;
    ea = abs((b - a)/x);        
    while ea > eps  % 控制二分法结束条件
      
        fx = fun(x); % 计算中点的函数值
        if fa*fx>0  % 条件
            a = x;   % 端点更新
            fa = fx;  % 端点函数值更新
        elseif fb*fx>0  % 条件
            b = x;  % 端点更新
            fb = fx;  % 端点函数值更新
        else
            break
        end
        
        xold = x;
        x=(a+b)/2;  % 二分区间端点        
        ea = abs((xold - x)/x);  
                        
        X(k)=x;
        k=k+1;
    end
end
iter=k;
end

%%

%f1 = @(x)(668.06 * (1 - exp(-0.146843 .* x)) ./ x - 40);

function [x,fx,iter,X, ea]=false_pos(fun,a,b,eps)
% 试位法求解非线性方程的根
% 输入参数：
%      ---fun：待求根方程的函数描述
%      ---a,b：初始区间的端点
%      ---eps：精度要求，默认值为1e-6
%      ---p1,p2,...：求根函数附加参数
% 输出参数：
%      ---x：非线性方程的近似根
%      ---fx：根x处的函数值
%      ---iter：迭代次数
%      ---X：每一步迭代的结果

if nargin<3
    error('输入参数至少需要3个！')
end
if nargin<4|isempty(eps)
    eps=1e-6;
end

fa = fun(a);
fb = fun(b);
% fa=fun(a,varargin{:});fb=fun(b,varargin{:});
k=1;
if fa*fb>0
    warning(['区间[',num2str(a),',',num2str(b),']内可能没有根']);
elseif fa==0
    x=a;fx=fa;
elseif fb==0
    x=b;fx=fb;
else
    
    x = b-(b-a)*fb/(fb-fa);
    ea = abs((b - a)/x);  
    
    while ea > eps  % 控制试位法结束条件

        fx = fun(x); % 计算x处的函数值
        if fa*fx>0  % 条件
            a = x;   % 端点更新
            fa = fx;  % 端点函数值更新
        elseif fb*fx>0  % 条件
            b = x;  % 端点更新
            fb = fx;  % 端点函数值更新
        else
            break
        end
        
        xold = x;
        x = b-(b-a)*fb/(fb-fa);
        ea = abs((xold - x)/x);  
        X(k)=x;k=k+1;
    end
end
iter=k;
end

function [x,iter,X]=fixpt(g,x0,eps,maxiter)
% 简单迭代法求非线性方程的根
% 输入参数：
%      ---g：迭代函数
%      ---x0：初始迭代点
%      ---eps：精度要求，默认值为1e-6
%      ---maxiter：最大迭代次数，默认值为1e4
% 输出参数：
%      ---x：非线性方程的近似根
%      ---iter：迭代次数
%      ---X：每一步迭代的结果
if nargin<2
    error('输入参数至少需要3个！')
end
if nargin<3|isempty(eps)
    eps=1e-6;
end
if nargin<4|isempty(maxiter)
    maxiter=1e4;
end
err=1;k=0;
while err>eps
    k=k+1;
    x1=g(x0);  % 迭代
    err=abs(x1-x0);  % 相邻两次的误差
    x0=x1;  % 更新
    X(k)=x1;
end
if k==maxiter
    error('迭代次数超限，迭代失败！')
end
x=x1;iter=k;X=X';

end