function solverData = saupdates(solverData,problem,options)
solverData.iteration = solverData.iteration+1; %更新迭代次数
solverData.k = solverData.k+1;  %更新退火参数k
% 如果SA接受的解的数目达到一定值，做回火处理
if solverData.acceptanceCounter == options.ReannealInterval && solverData.iteration ~=0
    solverData = reanneal(solverData,problem,options);
end
%参数传递
optimvalues = saoptimStruct(solverData,problem);
%创建一个新的温度矢量
try
    solverData.temp = max(eps,options.TemperatureFcn(optimvalues,options));
catch userFcn_ME
    gads_ME = MException('globaloptim:saupdate:invalidTemperatureFcn', ...
        'Failure in TemperatureFcn evaluation.');
    userFcn_ME = addCause(userFcn_ME,gads_ME);
    rethrow(userFcn_ME)
end
% 如果需要，更新最优解
if solverData.currentfval < solverData.bestfval
    solverData.bestx = solverData.currentx;
    solverData.bestfval = solverData.currentfval;
end
solverData.bestfvals(end+1) = solverData.bestfval;
if solverData.iteration > options.StallIterLimit
    solverData.bestfvals(1) = [];
end
