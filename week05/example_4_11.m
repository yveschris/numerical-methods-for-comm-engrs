f=@(t,a,b)sin(t).^2.*exp(-a*t)-b*abs(t)-0.1;  % ���庯�����ʽ
t=-10:0.01:10;
a=0.1;b=0.5;
plot(t,f(t,a,b))  % ����ͼ��
hold on
grid on
grid minor
plot(xlim,[0 0],'k')  % ����ֱ��y=0
[tt,yy]=ginput(4)  % ���ȡ��
for k=1:length(tt)
    x=fzero(@(t)f(t,a,b),tt(k));  % fzero�������
    % x=fzero(f,tt(k),[],a,b);
    T(k)=x;  % �������δ�������T��
end
T