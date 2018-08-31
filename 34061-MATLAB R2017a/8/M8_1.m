clear all;
objectiveFunction=@Rastrigin_fun;  %目标函数句柄
x0=[1,1];  %初始值
lb=[-2,-2];  %变量下界
ub=[2,2];  %变量上界
options=saoptimset('MaxIter',500,'StallIterLim',500,'TolFun',1e-100,...
    'AnnealingFcn',@annealingfast,'InitialTemperature',100,'TemperatureFcn',...
    @temperatureexp,'ReannealInterval',500,'PlotFcns',{@saplotbestx,@saplotbestf,...
@saplotx,@saplotf});
[x,fval]=simulannealbnd(objectiveFunction,x0,lb,ub,options)
