function solverData = saupdates(solverData,problem,options)
solverData.iteration = solverData.iteration+1; %���µ�������
solverData.k = solverData.k+1;  %�����˻����k
% ���SA���ܵĽ����Ŀ�ﵽһ��ֵ�����ػ���
if solverData.acceptanceCounter == options.ReannealInterval && solverData.iteration ~=0
    solverData = reanneal(solverData,problem,options);
end
%��������
optimvalues = saoptimStruct(solverData,problem);
%����һ���µ��¶�ʸ��
try
    solverData.temp = max(eps,options.TemperatureFcn(optimvalues,options));
catch userFcn_ME
    gads_ME = MException('globaloptim:saupdate:invalidTemperatureFcn', ...
        'Failure in TemperatureFcn evaluation.');
    userFcn_ME = addCause(userFcn_ME,gads_ME);
    rethrow(userFcn_ME)
end
% �����Ҫ���������Ž�
if solverData.currentfval < solverData.bestfval
    solverData.bestx = solverData.currentx;
    solverData.bestfval = solverData.currentfval;
end
solverData.bestfvals(end+1) = solverData.bestfval;
if solverData.iteration > options.StallIterLimit
    solverData.bestfvals(1) = [];
end
