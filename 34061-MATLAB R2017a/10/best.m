%����������Ӧֵ���ĸ��弰����Ӧֵ
function [bestindividual,bestfit]=best(pop,fitvalue)
global popsize 
bestindividual=pop(1,:);
bestfit=fitvalue(1);
for i=2:popsize
    if fitvalue(i)>bestfit   %���ĸ���
        bestindividual=pop(i,:);
        bestfit=fitvalue(i);
    end
end
