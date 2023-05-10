%%

A = [0 3 1; 0 4 -2; 2 1 2]
R = zeros(size(A));
Q = zeros(size(A));
n = size(A, 1);

for j=1:n
    v=A(:,j)
    for i=1:j-1
        R(i,j)=Q(:,i)'*A(:,j);
        v=v-R(i,j)*Q(:,i)
    end
    R(j, j)=norm(v)
    Q(:,j)=v/R(j,j);
end

Q


%%
A = [1 2; 3 4];
D=QR_basicv2(A)

y = null(A - lamba*eye(size(A)))