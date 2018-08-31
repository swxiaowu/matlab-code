 clear all;
%输出两个目标向量T
T = [+1 -1; -1 +1];
%在二维平面内绘制出这两个稳定平衡点
plot(T(1,:),T(2,:),'rp')             %效果如图4-38所示
axis([-1.1 1.1 -1.1 1.1])
xlabel('a(1)');
ylabel('a(2)');
%创建网络及测试
net = newhop(T);              %设计Hopfield网络
[Y,Pf,Af] = net([],[],T);         %网络测试
Y
%再随机选取初始点，对网络进行仿真
a = {rands(2,1)};
[y,Pf,Af] = net({20},{},a);
%绘制初始点向平衡点逼近过程
record = [cell2mat(a) cell2mat(y)];
start = cell2mat(a);
hold on
plot(start(1,1),start(2,1),'bx',record(1,:),record(2,:))   %效果如图4-39所示
%再随机选取25个初始点进行测试
color = 'rgbmy';
for i=1:25
   a = {rands(2,1)};
   [y,Pf,Af] = net({20},{},a);
   record=[cell2mat(a) cell2mat(y)];
   start=cell2mat(a);
   plot(start(1,1),start(2,1),'kx',record(1,:),record(2,:),color(rem(i,5)+1))
end
