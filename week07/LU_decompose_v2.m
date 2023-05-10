function [L,U]=LU_decompose_v2(A)
% LU分解求解线性方程组
% 输入参数：
%      ---A：线性方程组的系数矩阵
%      ---b：线性方程组的右端项
% 输出参数：
%      ---L：分解后的下三角矩阵
%      ---U：分解后的上三角矩阵
%      ---x：线性方程组的解
n=height(A); U=zeros(n,n);
L=eye(n,n);
U(1,:)=A(1,:);
L(2:n,1)=A(2:n,1)/U(1,1);
for k=2:n
    U(k,k:n)=A(k,k:n)-L(k,1:k-1)*U(1:k-1,k:n);
    L(k+1:n,k)=A(k+1:n,k)-L(k+1:n,1:k-1)*U(1:k-1,k);
    L(k+1:n,k)=L(k+1:n,k)/U(k,k);
end
