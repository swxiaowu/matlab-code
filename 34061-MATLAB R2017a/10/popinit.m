%��Ⱥ��ʼ������(������Ϊ�գ�ȫ���������)
function pop = popinit(n,length)
for i=1:n
    flag=0;
    while flag==0
        [a,b]=sort(rand(1,31));    
        pop(i,:)=b(1:length);
        flag=test(pop(i,:));
    end
end