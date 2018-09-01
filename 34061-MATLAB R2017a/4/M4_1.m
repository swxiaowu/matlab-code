clear all;
%定义输入向量及目标向量
P=[1 2;-1 1;-2 1;-4 0]'; % '表转置
T=[0.2 0.8 0.8 0.2];
%创建BP网络和定义训练函数及参数
%traingd：基本梯度下降法，收敛速度比较慢
net=newff([-1 1;-1 1],[5 1],{'logsig','logsig'},'traingd');
net.trainParam.goal=0.001; %训练目标的最小误差
net.trainParam.epochs=5000; %训练次数
[net,tr]=train(net,P,T);         %网络训练
disp('网络训练后的第一层权值为：')
iw1=net.iw{1};
disp(iw1)
disp('网络训练后的第一层阈值：')
b1=net.b{1};
disp(b1)
disp('网络训练后的第二层权值为：')
iw2=net.Lw{2};
disp(iw2)
disp('网络训练后的第二层阈值：')
b2=net.b{2};
disp(b2)
save M4_1 net;
%通过测试样本对网络进行仿真
load M4_1 net;          %载入训练后的BP网络
p1=[1 2;-1 1;-2 1;-4 0]';    %测试输入向量
a2=sim(net,p1);              %仿真输出结果
disp('输出分类结果为：');
a2=a2>0.5;                    %根据判决门限，输出分类结果
disp(a2)
