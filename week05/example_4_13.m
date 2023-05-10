F=@(x)[sin(2*x(2))*exp(x(1))-2*x(2)^2-1;cos(2*x(1))+x(2)*sin(x(1))];  % ���巽����
ezplot('sin(2*y)*exp(x)-2*y^2-1',[0,7,-6,6])  % ���Ƶ�һ�����̵�����ͼ
hold on  % ͼ�α���
h=ezplot('cos(2*x)+y*sin(x)');  % ���Ƶڶ������̵�����ͼ
set(h,'Color','r')  % ���õڶ������ߵ���ɫ
title(char('sin(2*y)*exp(x)-2*y^2-1','cos(2*x)+y*sin(x)'))  % ��ӱ���
[xx,yy]=ginput  % ���ȡ��
X=[];
for k=1:length(xx)
    x=fsolve(F,[xx(k),yy(k)]);  % fsolve�����󷽳���ĸ�
    X=[X;x];  % �������δ������X��
end
X
plot(X(:,1),X(:,2),'k*','MarkerSize',14)  % ���Ʒ�����ĸ�