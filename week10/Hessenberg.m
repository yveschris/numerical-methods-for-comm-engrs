function HB=Hessenberg(A)
% ����Householder�任������AΪ����������
% ���������
%       ---A�������n��ʵ����
% ���������
%       ---HB�����������������
[m,n]=size(A);
if m~=n
    error('����ľ���A���Ƿ���')
end
HB=A;
for k=1:n-2
    x=HB(k+1:n,k);
    H=househ(x);
    HB(k+1:n,1:n)=H*HB(k+1:n,1:n);
    HB(1:n,k+1:n)=HB(1:n,k+1:n)*H;
end
