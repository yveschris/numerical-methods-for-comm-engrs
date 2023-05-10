%%
x = 0:0.1:2*pi;
% xx = [x' x'];
y1 = sin(x);
% y = [sin(x)' cos(x)'];
A = [1 2; 3 4; 6 7];
B = [5 6; 7 8; 6 7];
figure(1)
plot(A, B, '-pr');

figure(2)
plot(A(:, 1), B(:, 1));
%%
x = 0:0.01:10;
y = exp(-x);
semilogy(x, y)

%%

x=-pi:pi/20:pi;
y1=sin(x);
y2=cos(x);
plot(x,y1,'b-');
hold on;
plot(x,y2,'k--');
% hold off;
xlabel('time, t','FontSize', 20);
ylabel('voltage, v','FontSize', 20);
grid on
legend ('sin x','cos x','FontSize', 20);


%%

x=0:0.1*pi:2*pi;
subplot(2,2,1)
plot(x,sin(x),'-*');
title('sin(x) sin(x) sin(x)');
subplot(2,2,2)
plot(x,cos(x),'--o');
title('cos(x)');
subplot(2,2,3)
plot(x,sin(2*x),'-.*');
title('sin(2x)');
subplot(2,2,4);
plot(x,cos(3*x),':d')
title('cos(3x)') 
