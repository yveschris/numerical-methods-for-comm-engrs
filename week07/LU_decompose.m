function [L,U,x]=LU_decompose(A,b)
% LU�ֽ�������Է�����
% ���������
%      ---A�����Է������ϵ������
%      ---b�����Է�������Ҷ���
% ���������
%      ---L���ֽ��������Ǿ���
%      ---U���ֽ��������Ǿ���
%      ---x�����Է�����Ľ�
n=length(b); U=zeros(n,n);
L=eye(n,n);
U(1,:)=A(1,:);
L(2:n,1)=A(2:n,1)/U(1,1);
for k=2:n
    U(k,k:n)=A(k,k:n)-L(k,1:k-1)*U(1:k-1,k:n);
    L(k+1:n,k)=A(k+1:n,k)-L(k+1:n,1:k-1)*U(1:k-1,k);
    L(k+1:n,k)=L(k+1:n,k)/U(k,k);
end
% �������Ƿ����飺Ly=b
y=zeros(n,1);
y(1)=b(1);
for k=2:n
    y(k)=b(k)-L(k,1:k-1)*y(1:k-1);
end
% �������Ƿ����飺Ux=y
x=zeros(n,1); x(n)=y(n)/U(n,n);
for k=n-1:-1:1
    x(k)=(y(k)-U(k,k+1:n)*x(k+1:n))/U(k,k);
end
