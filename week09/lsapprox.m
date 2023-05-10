function [A,B,p] = lsapprox(wfun,phifun,fun,a,b)
% ���ƽ���ƽ�
% ���������
%      ---wfun��Ȩ����
%      ---phifun��������
%      ---fun���ƽ�����
%      ---a,b���ƽ�����Ķ˵�
%      ---n����ѱƽ��Ĵ�����Ĭ��ֵΪ1
% ���������
%      ---A�����������ϵ������
%      ---b������������Ҷ�����
%      ---p�����ƽ���ƽ���ϵ��
n=size(phifun,1);
A=zeros(n);
for i=1:n
    for j=1:n
        f1=str2func(['@(x)(',wfun,')','.*','(',phifun(i,:),')',...
            '.*','(',phifun(j,:),')']);
        A(i,j)=quad(f1,a,b);
    end
    f2=str2func(['@(x)(',wfun,')','.*','(',phifun(i,:),')','.*','(',fun,')']);
    B(i)=quad(f2,a,b);
end
B=B';a=A\B;
p=a';
