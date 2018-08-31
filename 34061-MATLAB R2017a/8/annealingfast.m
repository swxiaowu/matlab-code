function newx = annealingfast(optimValues,problem)
%默认的退火函数，作用是产生新解
currentx = optimValues.x;    %当前解赋值
nvar = numel(currentx);      %解中的自变量个数
newx = currentx;
y = randn(nvar,1);           %产生随机数
y = y./norm(y);              %映射值（-1,1）区间
%在当前解的基础上产生新解，其中，optimValues.temperature为当前温度
newx(:) = currentx(:) + optimValues.temperature.*y; 
%当解有上下限约束时，确保新解在约束范围内
newx = sahonorbounds(newx,optimValues,problem);
