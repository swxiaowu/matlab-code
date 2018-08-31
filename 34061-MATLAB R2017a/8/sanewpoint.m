function solverData = sanewpoint(solverData,problem,options)
optimvalues = saoptimStruct(solverData,problem);  
newx = problem.x0; %产生新解
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
    if options.AcceptanceFcn(optimvalues,newx,newfval)  %判断是否接受新解
       solverData.currentx(:) = newx;     %如果接受新解，则进行相应的赋值
       solverData.currentfval = newfval;                %目标函数值也是
       %接受的新点数目标1，为判断是否回炎做准备
       solverData.acceptanceCounter = solverData.acceptanceCounter + 1; 
    end
catch userFcn_ME
    gads_ME = MException('globaloptim:sanewpoint:invalidAcceptanceFcn', ...
        'Failure in AnnealingFcn evaluation.');
    userFcn_ME = addCause(userFcn_ME,gads_ME);
    rethrow(userFcn_ME)
end
