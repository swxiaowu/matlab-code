clear all;
objectiveFunction=@Rastrigin_fun;  %Ŀ�꺯�����
x0=[1,1];  %��ʼֵ
lb=[-2,-2];  %�����½�
ub=[2,2];  %�����Ͻ�
options=saoptimset('MaxIter',500,'StallIterLim',500,'TolFun',1e-100,...
    'AnnealingFcn',@annealingfast,'InitialTemperature',100,'TemperatureFcn',...
    @temperatureexp,'ReannealInterval',500,'PlotFcns',{@saplotbestx,@saplotbestf,...
@saplotx,@saplotf});
[x,fval]=simulannealbnd(objectiveFunction,x0,lb,ub,options)
