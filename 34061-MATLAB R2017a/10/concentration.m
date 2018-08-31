%用于计算个体之间的浓度
function concentration = concentration(i,M,individuals)
concentration=0;
for j=1:M
    xsd=similar(individuals.chrom(i,:),individuals.chrom(j,:));  %第i个体与种群个体间的相似度
    %相似度大于阀值
    if xsd>0.7
        concentration=concentration+1;
    end
end
concentration=concentration/M;
end