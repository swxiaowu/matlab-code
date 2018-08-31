 clear all;
%产生输入输出数据
%设置步长
interval=0.01;
%产生x1 x2
x1=-1.5:interval:1.5;
x2=-1.5:interval:1.5;
%按照函数先求得相应的函数值，作为网络的输出
F=20+x1.^2-10*cos(2*pi*x1)+x2.^2-10*cos(2*pi*x2);
%网络建立和训练
%网络建立输入为[x1;x2]，输出为F。Spread使用默认值1
net=newrbe([x1;x2],F);
%将原数据回带，测试网络效果
ty=sim(net,[x1;x2]);
%使用图像来查看网络对非线性函数的拟合效果
plot3(x1,x2,F,'rd');
hold on;
plot3(x1,x2,ty,'b-.');
view(113,36)
title('可视化的方法观察严格的RBF神经网络的拟合效果')
xlabel('x1');
ylabel('x2');
zlabel('F');
grid on;



clear all;
%产生训练样本（训练输入，训练输出）
%ld为样本例数
ld=400;
%产生2*ld的矩阵
x=rand(2,ld);
%将x转换到（-1.5 1.5）区间
x=(x-0.5)*1.5*2;
% x的第一行为x1，第二行为x2
x1=x(1,:);
x2=x(2,:);
%计算网络输出F值
F=20*x1.^2-10*cos(2*pi*x1)+x2.^2-10*cos(2*pi*x2);
%建立RBF神经网络
%采用approximage RBF神经网络，spread为默认值
net=newrb(x,F);
%建立测试样本
interval=0.1;
[i,j]=meshgrid(-1.5:interval:1.5);
row=size(i);
tx1=i(:);
tx1=tx1';
tx2=j(:);
tx2=tx2';
tx=[tx1;tx2];
%使用建立的RBF网络进行模拟，得出网络输出
ty=sim(net,tx);
%使用图像，给出3维图
interval=0.1;
[x1,x2]=meshgrid(-1.5:interval:1.5);
F=20*x1.^2-10*cos(2*pi*x1)+x2.^2-10*cos(2*pi*x2);
subplot(131);mesh(x1,x2,F);
title('真正的函数图像');
%网络得出的函数图像
v=reshape(ty,row);
subplot(1,3,2);mesh(i,j,v);
zlim([0 60]);
title('RBF神经网络图像');
%误差图像
subplot(1,3,3);mesh(x1,x2,F-v);
zlim([0 60]);
title('误差图像');
