%creating function and partial derivatives of the function
syms x y
f = x^2 + y^2 + 5;

figure
fsurf(f, [-5, 5, -5, 5])

f_x = diff(f, x);
f_y = diff(f, y);
alpha = [2, 1, 0.1];
%first iteration

for k = 1:3
    w_old = [3, 4];
    x = w_old(1);
    y = w_old(2);
    w_new = w_old - alpha(k) * [subs(f_x), subs(f_y)];

    %subsequent iterations
    for i = 1:40
        hold on
        subplot(1, 3, k)
        plot([w_new(1), w_old(1)], [w_new(2), w_old(2)])
        xlim([-5, 5])
        ylim([-5, 5])
        w_old = w_new;
        x = w_old(1);
        y = w_old(2);
        w_new = w_old - alpha(k) * [subs(f_x), subs(f_y)];
        hold off

    end
end
