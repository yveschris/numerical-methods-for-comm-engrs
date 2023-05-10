

x = [4879 57900000;
12104 108200000;
12756 149600000;
6792 227900000;
142984 778600000;
120536 1433500000;
51118 2872500000;
49528 4495100000];

x = fliplr(x);
x(:, 1) = x(:, 1)./149600000;
x(:, 2) = x(:, 2)./12756;

names = ["Mercury"
"Venus"
"Earth"
"Mars "
"Jupiter"
"Saturn"
"Uranus"
"Neptune"];


%%

figure(1)
plot(x(:, 1), x(:, 2), 'o');

for i = 1:length(names)
    text(x(i, 1) + 0.5, x(i, 2), names(i));
end

grid on

%%
figure(2)

loglog(x(:, 1), x(:, 2), 'o');

for i = 1:length(names)
    xi = 10 ^ (10 * log10(x(i, 1)) / 10 - 0.1);
    
    if mod(i, 2) == 0
        yi = 10 ^ (0.1 + 10 * log10(x(i, 2)) / 10);
        text(xi, yi, names(i));
    else
        yi = 10 ^ (10 * log10(x(i, 2)) / 10 - 0.1);
        text(xi, yi, names(i));
    end    
end

xlim([0.1, 10 ^ ceil(log10(x(end, 1)))]);
ylim([0.1, 10 ^ ceil(log10(max(x(:, 2))))]);
xlabel('distance')
ylabel('diameter')
grid on
