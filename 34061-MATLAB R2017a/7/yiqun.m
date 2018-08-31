 clear all;
%% ��ʼ��
ant=300;    %��������
times=80;   %�����ƶ�����
rou=0.9;    %��Ϣ�ػӷ�ϵ��
p0=0.2;     %ת�Ƹ��ʳ���
lower_1=-1;  %����������Χ
upper_1=1;
lower_2=-1;  
upper_2=1;

for i=1:ant
    X(i,1)=(lower_1+(upper_1-lower_1)*rand);  %����������ϵĳ�ֵλ��
    X(i,2)=(lower_2+(upper_2-lower_2)*rand);  %����������ϵĳ�ֵλ��
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
title('���ϵĳ�ʼ�ֲ�λ��');
xlabel('x');ylabel('y');zlabel('f(x,y)');
for T=1:times
    lamda=1/T;
    [tau_best(T),bestindex]=max(tau);
    for i=1:ant
        p(T,i)=(tau(bestindex)-tau(i))/tau(bestindex);  %����״̬ת�Ƹ���
    end
    for i=1:ant
        if p(T,i)<p0;  %�ֲ�����
            temp1=X(i,1)+(2*rand-1)*lamda;
            temp2=X(i,2)+(2*rand-1)*lamda;
        else                           %ȫ������
            temp1=X(i,1)+(upper_1-lower_1)*(rand-0.5);
            temp1=X(i,2)+(upper_2-lower_2)*(rand-0.5);
        end
        %Խ�紦��
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
        
        if Maco(temp1,temp2)>Maco(X(i,1),X(i,2))  %�ж������Ƿ��ƶ�
            X(i,1)=temp1;
            X(i,2)=temp2;
        end
    end
    for i=1:ant
        tau(i)=(1-rou)*tau(i)+Maco(X(i,1),X(i,2));  %������Ϣ��
    end
end
subplot(1,2,2);mesh(x,y,z);
hold on;
x=X(:,1);
y=X(:,2);
plot3(x,y,eval(f),'r+');
hold on;
title('���ϵ����շֲ�λ��');
xlabel('x');ylabel('y');zlabel('f(x,y)');

[max_value,max_index]=max(tau)
maxX=X(max_index,1)
maxY=X(max_index,2)
maxValue=Maco(X(max_index,1),X(max_index,2))
