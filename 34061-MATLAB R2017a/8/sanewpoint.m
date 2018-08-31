function solverData = sanewpoint(solverData,problem,options)
optimvalues = saoptimStruct(solverData,problem);  
newx = problem.x0; %�����½�
try     
     newx(:) = options.AnnealingFcn(optimvalues,problem); 
catch userFcn_ME
    gads_ME = MException('globaloptim:callAnnealingFunction:invalidAnnealingFcn', ...
        'Failure in AnnealingFcn evaluation.');
    userFcn_ME = addCause(userFcn_ME,gads_ME);
    rethrow(userFcn_ME)
end
newfval = problem.objective(newx);
solverData.funccount = solverData.funccount+1;
try
    if options.AcceptanceFcn(optimvalues,newx,newfval)  %�ж��Ƿ�����½�
       solverData.currentx(:) = newx;     %��������½⣬�������Ӧ�ĸ�ֵ
       solverData.currentfval = newfval;                %Ŀ�꺯��ֵҲ��
       %���ܵ��µ���Ŀ��1��Ϊ�ж��Ƿ������׼��
       solverData.acceptanceCounter = solverData.acceptanceCounter + 1; 
    end
catch userFcn_ME
    gads_ME = MException('globaloptim:sanewpoint:invalidAcceptanceFcn', ...
        'Failure in AnnealingFcn evaluation.');
    userFcn_ME = addCause(userFcn_ME,gads_ME);
    rethrow(userFcn_ME)
end
