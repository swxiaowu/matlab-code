%计算个体的适应值
function fitvalue=calfitvalue(value)
global Cmin;
Cmin=0;
[px,py]=size(value);
for i=1:px
    if value(i)+Cmin+value(i)
        temp=Cmin+value(i);
    else
        temp=0;
    end
    fitvalue(i)=temp;
end
fitvalue=fitvalue'