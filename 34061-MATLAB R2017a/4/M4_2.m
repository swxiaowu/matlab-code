clear all;
echo on;
%NEWFF为生成一个新的前向神经网络
%TRAIN对BP神经网络进行训练
%SIM对BP神经网络进行仿真
pause  %按任意键开始
%P为输入矢量
P=[-1:0.05:1];  %
randn('seed',78341223);
%T为目标矢量
T=sin(2*pi*P)+0.1*randn(size(P));
%绘制样本数据点
plot(P,T,'+');
echo off;
hold on;
plot(P,sin(2*pi*P),':');
%绘制不含噪声的正弦曲线
echo on
pause
%创建一个新的前向神经网络
net=newff(minmax(P),[20,1],{'tansig','purelin'});
pause
echo off
disp('1. L-M优化算法 TRAINLM');
disp('2. 贝叶斯正则化算法 TRAINBR');
choice=input('请选择训练算法（1，2）：');
figure(gcf);
if(choice==1)
    echo on
    %采用L-M优化算法TRAINLM
    net.trainFcn='trainlm';
    pause
    %设置训练参数
    net.trainParam.epochs=500;
    net.tranParam.goal=1e-6;
    net=init(net);
    %重新初始化
    pause
elseif(choice==2)
    echo on
    %采用贝叶斯正则化算法TRAINBR
    net.trainFcn='trainbr';
    pause
    %设置训练参数
    net.trainParam.epochs=500;
    randn('seed',192736547);
    net=init(net);
    % 重新初始化
    pause
end
