function [y]=average(x)
% ��������Ԫ�ص�ƽ��ֵ
% average(x)��Ϊһ������xԪ�ص�ƽ��ֵ
% ���û���������������򽫱���
[m, n]=size(x);
if(~((m==1)||(n==1))||(m==1&&n==1))
    error('please input a vector');
end
y=sum(x)/length(x);  %����