%�������Ӧֵ��Ŀ�꣺�����ɱȽϵķǸ���ֵ
function fitvalue=calfitvalue(value)
fitvalue=value;
global popsize
Cmin=0;
for i=1:popsize
    if value(i)+Cmin>0  %valueΪһ������
        temp=Cmin+value(i);
    else
        temp=0;
    end
    fitvalue(i)=temp;  %��һ����
end
