%�����������ʵ�����취���б���
function ret=Mutation(pmutation,chrom,sizepop,length1)
% ÿһ��forѭ���У����ܻ����һ�α��������Ⱦɫ�������ѡ��ģ�����λ��Ҳ�����ѡ���
for i=1:sizepop       
    % �������
    pick=rand;
    while pick==0
        pick=rand;
    end
    index=unidrnd(sizepop);
   % �ж��Ƿ����
    if pick>pmutation
        continue;
    end
    pos=unidrnd(length1);
    while pos==1
        pos=unidrnd(length1);
    end    
    nchrom=chrom(index,:);
    nchrom(pos)=unidrnd(31);
    while length(unique(nchrom))==(length1-1)
        nchrom(pos)=unidrnd(31);
    end    
    flag=test(nchrom);
    if flag==1
        chrom(index,:)=nchrom;
    end    
end
ret=chrom;
end
 