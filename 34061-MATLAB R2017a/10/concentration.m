%���ڼ������֮���Ũ��
function concentration = concentration(i,M,individuals)
concentration=0;
for j=1:M
    xsd=similar(individuals.chrom(i,:),individuals.chrom(j,:));  %��i��������Ⱥ���������ƶ�
    %���ƶȴ��ڷ�ֵ
    if xsd>0.7
        concentration=concentration+1;
    end
end
concentration=concentration/M;
end