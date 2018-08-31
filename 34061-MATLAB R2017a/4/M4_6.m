clear all;
x=-9:8;      %样本的x值
y=[129,-32 -118 -138 -125 -97 -55 -23 -4 2 1 -31 -72 -121 -142 -174 -155 -77];
plot(x,y,'ro');
p=x;
T=y;
tic;  %计时开始
net=newrb(p,T,0,2);  %创建径向基网络
toc   %计时结束
xx=-9:0.2:8;
yy=sim(net,xx);  %径向基网络仿真
hold on;
plot(xx,yy);
tic;  %计时开始
net2=newgrnn(p,T,0.5);  %设计广义回归网络
toc;  %计时结束
yy2=sim(net,xx);  %广义回归网络仿真
plot(xx,yy2,'.-k');
legend('原始数据','径向基拟合','广义回归拟合');
