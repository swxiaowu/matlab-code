function [y]=average(x)
% 计算向量元素的平均值
% average(x)，为一个向量x元素的平均值
% 如果没有输入向量，程序将报错
[m, n]=size(x);
if(~((m==1)||(n==1))||(m==1&&n==1))
    error('please input a vector');
end
y=sum(x)/length(x);  %计算