%%
tic
A = [3 -0.1 -0.2; 0.1 7 -0.3; 0.3 -0.2 10];
b = [7.85; -19.3; 71.4];

[U, x] = naive_gauss(A, b);
toc

%%

N = 10;
A = magic(N);
b = ones(N, 1);
[U, x] = naive_gauss(A, b);

%%
N = 10;
A = magic(N);
b = 2 * ones(N, 1);
[U, x] = naive_gauss(A, b);

%%
% u = 1;
% v = 1;
% 
% feather(u,v)
% 
% A = [1 2; 3 4];
% b = A * [u; v];

% feather([u b(1)],[v b(2)])


