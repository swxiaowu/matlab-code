%实现群体的初始化编码
function pop=initpop(popsize,chromlength)
% popsize表示群体的大小
% chromlength表示染色体的长度（二值数的长度），长度大小取决于变量的二进制编码的长度
pop=round(rand(popsize,chromlength));
%round对矩阵的每个单元进行圆整，这样产生随机的初始种群
end