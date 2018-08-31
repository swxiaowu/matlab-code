function value=calobjvalue(pop)
temp1=decodechrom(pop,1,10);  %将pop每行转化成十进制数
x=temp1*10/1023;  %将二值域中的数转化为变量域的数
value=9*sin(5*x)+8*cos(4*x);  %计算目标函数值
end