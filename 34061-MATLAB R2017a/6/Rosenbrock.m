function result=Rosenbrock(x)  
%����x,������Ӧ��yֵ,��x=(1,1,��,1) ����ȫ�ּ�С��0,Ϊ�õ����ֵ������ֵȡ�෴��  
[row,col]=size(x);  
if row>1  
    error('����Ĳ�������');  
end  
result=100*(x(1,2)-x(1,1)^2)^2+(x(1,1)-1)^2;  
result=-result;  
