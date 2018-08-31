function newx = sahonorbounds(newx,optimValues,problem)
%作用是确保产生的新解在上下限约束范围内
if ~problem.bounded  %对于没有约束的优化问题，不做处理
    return
end
xin = newx;    %存储newx
newx = newx(:); %转化为列向量
lb = problem.lb; %下限约束
ub = problem.ub;  %上限约束
lbound = newx < lb; %查看是否在下限范围之内
ubound = newx > ub;  %查看是否在上限范围之内
alpha = rand;  %产生（0,1）区间的随机数
% 如果有自变量不在约束范围内
if any(lbound) || any(ubound)
    projnewx = newx;  %此时的projnewx不在约束范围内
    %如果某自变量超出下限范围，则将下限范围值赋给该自变量，
%使projnewx满足下限约束
    projnewx(lbound) = lb(lbound); 
    %如果某自变量超出上限范围，则将下限范围值赋给该自变量，
%使projnewx满足上限约束
    projnewx(ubound) = ub(ubound);
    %此时的projnewx刚好在约束范围内，optimValues.x即当前解，
%因此产生的newx一定满足上下限约束条件
    newx = alpha*projnewx + (1-alpha)*optimValues.x(:);
    newx = reshapeinput(xin,newx); %将newx转化回行向量
else
    newx = xin; %如果在约束范围内，赋回刚才存储的newx
end
