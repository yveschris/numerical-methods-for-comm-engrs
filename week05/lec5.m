%%

%% newton method
tic
[xx,iter,X]=newton(@f2,0,1e-8);  % Newton法求根
xx
toc

%% secand method
tic
f3 = @(x)(exp(-x) - x);

[x,iter,X]=secant(f3,0,1,1e-8);
x
toc
%% multiple roots
[x1,iter1,X1]=newton_reroot(@f6, 0);  % 重根情形的求解

%% muller's method

f=@(x)(x ^ 3 - 13 * x - 12);
x0=4.5;x1=5.5;x2=5;
[xx,iter,X]=parabola(f,x0,x1,x2);

%%
tic
f3 = @(x)(exp(-x) - x);

[x,iter,X]=secant(f3,0,1,1e-8);
toc

tic

fun = @(x) exp(-x) - x; % function
x0 = 0; % initial interval
% options = optimset('Display','iter'); % show iterations
[x fval exitflag output] = fzero(fun,x0);
toc

%% 

function [y,dy] = f2(x)
syms t
y = exp(-t) - t;  % 计算函数值
dy = diff(y);  % 求1阶导数
t = x;
dy = eval(dy);  % 求数值
y = eval(y);
end

function [y,dy, d2y] = f6(x)
syms t
y = t ^ 3 - 5 * t ^ 2 + 7 * t - 3;  % 计算函数值
dy = diff(y);  % 求1阶导数
d2y = diff(y, 2);
t = x;
dy = eval(dy);  % 求数值
d2y = eval(d2y);
y = eval(y);
end



