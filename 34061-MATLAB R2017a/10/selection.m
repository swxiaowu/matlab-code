function newpop=selection(pop,fitvalue)
global popsize
fitvalue=hjjsort(fitvalue);
totalfit=sum(fitvalue);  %����Ӧֵ֮��
fitvalue=fitvalue/totalfit;  %�������屻ѡ��ĸ���
fitvalue=cumsum(fitvalue);  
ms=sort(rand(popsize,1));
%��С�������У���rand(px,1)������һ�������������̶���ʽ�ı�ʾ��������С��������
fitin=1;
%fivalueΪһ������fitin����������Ԫ��λ����fitvalue(fitin)�����fitin����ĵ������屻ѡ��ĸ���
newin=1;
while newin<=popsize
    if(ms(newin))<fitvalue(fitin)
        %ms(newin)��ʾ����ms�������е�newinλ��ֵ��ͬ��fitvalue(fitin)
        newpop(newin,:)=pop(fitin,:);
        %��ֵ����������Ⱥ�еĵ�fitin���屣������һ��newpop
        nedin=newin+1;
    else
        fitin=fitin+1;
    end
end