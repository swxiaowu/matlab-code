%变异操作采用实数变异法进行变异
function ret=Mutation(pmutation,chrom,sizepop,length1)
% 每一轮for循环中，可能会进行一次变异操作，染色体是随机选择的，变异位置也是随机选择的
for i=1:sizepop       
    % 变异概率
    pick=rand;
    while pick==0
        pick=rand;
    end
    index=unidrnd(sizepop);
   % 判断是否变异
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
 