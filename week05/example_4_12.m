fun=@(x)[2*x(1) - x(2) - exp(-x(1));
    -x(1) + 2*x(2) - exp(-x(2))];  % ���������������巽����
x0 = [-5; -5];  % ������ֵ
options=optimset('Display','iter');  % �����Ż�������ʾÿһ���ĵ������
% options=optimset;options.Display='iter';
[x,fval] = fsolve(fun,x0,options)  % fsolve�����󷽳���ĸ�
