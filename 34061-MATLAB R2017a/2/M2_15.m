 clear all;
i=1;
while i<=5,   %计算1，2，3，4，5的阶乘
    s(i)=1;
    j=1;
    while j<=i   %内层循环用于求阶乘
        s(i)=s(i)*j;
        j=j+1;
    end
    i=i+1;
end
s;
