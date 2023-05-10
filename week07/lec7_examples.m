%% LU decomposition

A = [3 -0.1 -0.2; 0.1 7 -0.3; 0.3 -0.2 10];
b = [7.85 -19.3 71.4];

[L,U,x]=LU_decompose(A,b);

%%
tic
A = [3 -0.1 -0.2; 0.1 7 -0.3; 0.3 -0.2 10];
% b = [7.85 -19.3 71.4];

[L, U] = LU_decompose_v2(A);

Av = zeros(size(A));

for i = 1:height(A)
    b = zeros(1, height(A));
    b(i) = 1;
    x = FwAndBwSub(L, U, b);
    Av(:, i) = x';
end
toc

%% LU inverse
tic
A = [3 -0.1 -0.2; 0.1 7 -0.3; 0.3 -0.2 10];
Av = zeros(size(A));

for i = 1:height(A)
    b = zeros(1, height(A));
    b(i) = 1;
    [L,U,x]=LU_decompose(A,b);
    X(:, i) = x';
end
toc

%% Cholesky

A = [6 15 55; 15 55 225; 55 225 979];
b = [1 2 3];

tf = issymmetric(A);

[L,x]=Chol_decompose(A,b);

%%

A = [3 -0.1 -0.2;0.1 7 -0.3;0.3 -0.2 10];
b = [7.85;-19.3;71.4];
x = Gauss_seidel(A,b)

