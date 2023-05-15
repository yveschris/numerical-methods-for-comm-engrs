syms x;
y=exp(x^0.8)*sin(5*x);%求1~4阶导数的解析解
y1=diff(y,x); y2=diff(y,x,2); y3=diff(y,x,3); y4=diff(y,x,4);
h=0.05;x=0.05:h:10;


Y=exp(x.^0.8).*sin(5.*x); y11=subs(y1); y22=subs(y2); y33=subs(y3); y44=subs(y4);
y=[y11;y22;y33;y44];%求1~4阶导数的数值解，并和解析解比较
for k=1:4
    [dy,dx]=diff_ctr(Y,h,k);
    subplot(2,2,k)
    plot(x,y(k,:),dx,dy,':')
    title([num2str(k) '阶']);
end

%%
x=[7.0 10.5 13.0 17.5 34 40.5 44.5 48 56 61 68.5 76.5 80.5...
    91 96 101 104 106 111.5 118 123.5 136.5 142 146 150 157 158];  % x轴坐标
y1=[44 45 47 50 50 38 30 30 34 36 34 41 45 46 43 37 33 28 ...
    32 65 55 54 52 50 66 66 68];  % y轴上半部分的坐标
y2=[44 59 70 72 93 100 110 110 110 117 118 116 118 118 121 ...
    124 121 121 121 122 116 83 81 82 86 85 68];  % y轴下半部分坐标
xi=7:0.1:158;  % 加密x轴坐标
method={'pchip','spline'};  % 插值方法
for k=1:2
    figure(k)  % 产生图形窗口
    yi1(k,:)=interp1(x,y1,xi,char(method(k)));  % 一维插值
    yi2(k,:)=interp1(x,y2,xi,char(method(k)));  % 一维插值
    S=(trapz(xi,yi2(k,:))-trapz(xi,yi1(k,:)))/18^2*40^2;  % 数值积分求解
    r=abs(S-41288)/S;  % 求误差
    fill([xi,fliplr(xi)],[yi1(k,:),fliplr(yi2(k,:))],[0.8,0.7,0.3])  % 图形填充
    text(90,135,['国土面积：S=',num2str(S),'km^2'])  % 添加标注
    text(90,127,['误差：R=',num2str(100*r),'%'])  % 添加标注
    annotation('textbox','Position',[0.16 0.8 0.22 0.09],...
        'String',{'图例：9:20000000','单位：mm'});  % 添加文本框
    title(['国土轮廓的',char(method(k)),'插值结果'])  % 添加标题
end
figure
plot(xi,[diff(yi1);diff(yi2)])  % 绘制误差曲线
title('pchip插值与spline插值的误差曲线')  % 添加标题

