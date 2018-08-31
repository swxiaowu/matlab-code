 clear all  %清空环境变量
%%训练集/测试集产生
load water_data.mat   %导入数据,该数据存储在工作路径下
% 数据归一化
attributes = mapminmax(attributes);
%训练集：35个样本
P_train = attributes(:,1:35);
T_train = classes(:,1:35);
%测试集：4个样本
P_test = attributes(:,36:end);
T_test = classes(:,36:end);
%% 竞争神经网络创建、训练及仿真测试
net = competlayer(4,0.01,0.01);  %创建网络
net.trainParam.epochs = 500;  % 设置训练参数
net = train(net,P_train);  %训练网络
%仿真测试
%训练集
t_sim_compet_1 = net(P_train);
T_sim_compet_1 = vec2ind(t_sim_compet_1);
%测试集
t_sim_compet_2 = net(P_test);
T_sim_compet_2 = vec2ind(t_sim_compet_2);
%%SOFM神经网络创建、训练及仿真测试
net = selforgmap([4 4]);  %创建网络
net.trainParam.epochs = 200; %设置训练参数
net = train(net,P_train);  %训练网络
%仿真测试
%训练集
t_sim_sofm_1 = net(P_train);
T_sim_sofm_1 = vec2ind(t_sim_sofm_1);
%测试集
t_sim_sofm_2 = net(P_test);
T_sim_sofm_2 = vec2ind(t_sim_sofm_2)
%%结果对比
%竞争神经网络
result_compet_1 = [T_train' T_sim_compet_1']
result_compet_2 = [T_test' T_sim_compet_2']
%SOFM神经网络
result_sofm_1 = [T_train' T_sim_sofm_1']
result_sofm_2 = [T_test' T_sim_sofm_2']
