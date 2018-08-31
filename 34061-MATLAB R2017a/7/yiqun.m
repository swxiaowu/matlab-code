 clear all;
%% 初始化
ant=300;    %蚂蚁数量
times=80;   %蚂蚁移动次数
rou=0.9;    %信息素挥发系数
p0=0.2;     %转移概率常数
lower_1=-1;  %设置搜索范围
upper_1=1;
lower_2=-1;  
upper_2=1;

for i=1:ant
    X(i,1)=(lower_1+(upper_1-lower_1)*rand);  %随机设置蚂蚁的初值位置
    X(i,2)=(lower_2+(upper_2-lower_2)*rand);  %随机设置蚂蚁的初值位置
    tau(i)=Maco(X(i,1),X(i,2));
end
step=0.05;
f='-(x.^4+3*y.^4-0.2*cos(3*pi*x)-0.4*cos(4*pi*y)+0.6)';
[x,y]=meshgrid(lower_1:step:upper_1,lower_2:step:upper_2);
z=eval(f);
figure;
subplot(1,2,1);mesh(x,y,z);
hold on;
plot3(X(:,1),X(:,2),tau,'r+');
hold on;
title('蚂蚁的初始分布位置');
xlabel('x');ylabel('y');zlabel('f(x,y)');
for T=1:times
    lamda=1/T;
    [tau_best(T),bestindex]=max(tau);
    for i=1:ant
        p(T,i)=(tau(bestindex)-tau(i))/tau(bestindex);  %计算状态转移概率
    end
    for i=1:ant
        if p(T,i)<p0;  %局部搜索
            temp1=X(i,1)+(2*rand-1)*lamda;
            temp2=X(i,2)+(2*rand-1)*lamda;
        else                           %全局搜索
            temp1=X(i,1)+(upper_1-lower_1)*(rand-0.5);
            temp1=X(i,2)+(upper_2-lower_2)*(rand-0.5);
        end
        %越界处理
        if temp1<lower_1
            temp1=lower_1;
        end
        if temp1>upper_1
            temp1=upper_1;
        end
           if temp2<lower_2
            temp2=lower_2;
        end
        if temp2>upper_2
            temp2=upper_2;
        end
        
        if Maco(temp1,temp2)>Maco(X(i,1),X(i,2))  %判断蚂蚁是否移动
            X(i,1)=temp1;
            X(i,2)=temp2;
        end
    end
    for i=1:ant
        tau(i)=(1-rou)*tau(i)+Maco(X(i,1),X(i,2));  %更新信息量
    end
end
subplot(1,2,2);mesh(x,y,z);
hold on;
x=X(:,1);
y=X(:,2);
plot3(x,y,eval(f),'r+');
hold on;
title('蚂蚁的最终分布位置');
xlabel('x');ylabel('y');zlabel('f(x,y)');

[max_value,max_index]=max(tau)
maxX=X(max_index,1)
maxY=X(max_index,2)
maxValue=Maco(X(max_index,1),X(max_index,2))
