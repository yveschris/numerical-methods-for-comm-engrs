function [L,x]=Chol_decompose(A,b)
% Cholesky�ֽ�������Է�����
% ���������
%      ---A�����Է������ϵ������
%      ---b�����Է�������Ҷ���
% ���������
%      ---L���ֽ��������Ǿ���
%      ---x�����Է�����Ľ�
n=length(b);L=eye(n,n);
% Cholesky�ֽ�
for k=1:n
    L(k,k)=sqrt(A(k,k)-L(k,1:k-1)*L(k,1:k-1)');
    L(k+1:n,k)=(A(k+1:n,k)-L(k+1:n,1:k-1)*L(k,1:k-1)')/L(k,k);
end
% �������Ƿ�����Ly=b
y=zeros(n,1); y(1)=b(1)/L(1,1);
for k=2:n
    y(k)=(b(k)-L(k,1:k-1)*y(1:k-1))/L(k,k);
end
% �������Ƿ�����L'x=y
x=zeros(n,1);x(n)=y(n)/L(n,n);
for k=n-1:-1:1
    x(k)=(y(k)-L(k+1:n,k)'*x(k+1:n))/L(k,k);
end
