function [U,x]=naive_gauss(A,b)
% ˳��Gauss��ȥ��������Է�����
% ���������
%      ---A�����Է������ϵ������
%      ---b�����Է�������Ҷ���
% ���������
%      ---U����Ԫ��������Ƿ�������������
%      ---x�����Է�����Ľ�
n=length(b);
% ��Ԫ����
for k=1:n-1
    m=A(k+1:n,k)/A(k,k);
    A(k+1:n,k)=zeros(n-k,1);
    A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-m*A(k,k+1:n);
    b(k+1:n)=b(k+1:n)-m*b(k);    
end
U=[A,b];
% �ش�����
x=zeros(n,1);
x(n)=b(n)/A(n,n);  % ��x_n
for k=n-1:-1:1
    x(k)=(b(k)-A(k,k+1:n)*x(k+1:n))/A(k,k);  % ��x_k��k=n-1,n-2,��,1
end
