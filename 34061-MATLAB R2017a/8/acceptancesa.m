function acceptpoint = acceptancesa(optimValues,newx,newfval)    
%SAT采用的新解接受函数，作用是判断是否接受AnnealingFcn函数产生的新解
delE = newfval - optimValues.fval;  %新解的目标函数值与当前解的目标函数值之差
% 如果新解比当前解好，也即是说，新解的目标函数值比当前解的小
if delE < 0
    acceptpoint = true;   %那么接受该新解
else   %否则，以一定的概率接受新解
  %产生一个与当前温度及delE有关的值
    h = 1/(1+exp(delE/max(optimValues.temperature)));  
    if h > rand   %如果该值大于（0,1）区间的随机数
        acceptpoint = true;  %那么接受该新解
    else
        acceptpoint = false;  %否则拒绝该新解
    end
end
