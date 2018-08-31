%计算路径总长度
function len=M10_3a(D,f,N)
len=D(f(N),f(1));
for i=1:(N-1)
    len=len+D(f(i),f(i+1));
end