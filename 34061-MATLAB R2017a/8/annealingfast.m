function newx = annealingfast(optimValues,problem)
%Ĭ�ϵ��˻����������ǲ����½�
currentx = optimValues.x;    %��ǰ�⸳ֵ
nvar = numel(currentx);      %���е��Ա�������
newx = currentx;
y = randn(nvar,1);           %���������
y = y./norm(y);              %ӳ��ֵ��-1,1������
%�ڵ�ǰ��Ļ����ϲ����½⣬���У�optimValues.temperatureΪ��ǰ�¶�
newx(:) = currentx(:) + optimValues.temperature.*y; 
%������������Լ��ʱ��ȷ���½���Լ����Χ��
newx = sahonorbounds(newx,optimValues,problem);
