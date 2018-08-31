%个体的适应值，目标：产生可比较的非负数值
function fitvalue=calfitvalue(value)
fitvalue=value;
global popsize
Cmin=0;
for i=1:popsize
    if value(i)+Cmin>0  %value为一列向量
        temp=Cmin+value(i);
    else
        temp=0;
    end
    fitvalue(i)=temp;  %得一向量
end
