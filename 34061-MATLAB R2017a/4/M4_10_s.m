%BP算法训练：监督学习%
clear;
x = -4:0.01:4; %产生[-4,4]之间的行向量
y1 = sin((1/2)*pi*x) + sin(pi*x); %期望输出

%step:newff前馈神经网络创建函数
%minmax(x)获取x的取值范围,第一个隐藏层其实相当于对输入进行归一化
%第一个隐藏层含一个神经元，激活函数tansig,第二个隐含层含15个，激活函数是tansig，输出层含1个
%训练函数是梯度下降函数traingd
net = newff(minmax(x),[1,15,1],{'tansig','tansig','purelin'},'traingd');
net.trainparam.epochs = 6000;%设置最大迭代次数
net.trainparam.goal = 0.00001;%设置神经网络训练的目标最小误差

net.train(net,x,y1);%step2:训练神经网络，返回训练好的网络和误差记录
y2 = sim(net,x);%step3:获取BP训练后的实际输出

%绘图，原图（蓝色光滑线）和仿真效果图（红色+号点线）
plot(x,y1);%画出期望图像
hold on
plot(x,y2,'r+');%画出训练得出的图像