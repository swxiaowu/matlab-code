 clear all;
%���������������
%���ò���
interval=0.01;
%����x1 x2
x1=-1.5:interval:1.5;
x2=-1.5:interval:1.5;
%���պ����������Ӧ�ĺ���ֵ����Ϊ��������
F=20+x1.^2-10*cos(2*pi*x1)+x2.^2-10*cos(2*pi*x2);
%���罨����ѵ��
%���罨������Ϊ[x1;x2]�����ΪF��Spreadʹ��Ĭ��ֵ1
net=newrbe([x1;x2],F);
%��ԭ���ݻش�����������Ч��
ty=sim(net,[x1;x2]);
%ʹ��ͼ�����鿴����Է����Ժ��������Ч��
plot3(x1,x2,F,'rd');
hold on;
plot3(x1,x2,ty,'b-.');
view(113,36)
title('���ӻ��ķ����۲��ϸ��RBF����������Ч��')
xlabel('x1');
ylabel('x2');
zlabel('F');
grid on;



clear all;
%����ѵ��������ѵ�����룬ѵ�������
%ldΪ��������
ld=400;
%����2*ld�ľ���
x=rand(2,ld);
%��xת������-1.5 1.5������
x=(x-0.5)*1.5*2;
% x�ĵ�һ��Ϊx1���ڶ���Ϊx2
x1=x(1,:);
x2=x(2,:);
%�����������Fֵ
F=20*x1.^2-10*cos(2*pi*x1)+x2.^2-10*cos(2*pi*x2);
%����RBF������
%����approximage RBF�����磬spreadΪĬ��ֵ
net=newrb(x,F);
%������������
interval=0.1;
[i,j]=meshgrid(-1.5:interval:1.5);
row=size(i);
tx1=i(:);
tx1=tx1';
tx2=j(:);
tx2=tx2';
tx=[tx1;tx2];
%ʹ�ý�����RBF�������ģ�⣬�ó��������
ty=sim(net,tx);
%ʹ��ͼ�񣬸���3άͼ
interval=0.1;
[x1,x2]=meshgrid(-1.5:interval:1.5);
F=20*x1.^2-10*cos(2*pi*x1)+x2.^2-10*cos(2*pi*x2);
subplot(131);mesh(x1,x2,F);
title('�����ĺ���ͼ��');
%����ó��ĺ���ͼ��
v=reshape(ty,row);
subplot(1,3,2);mesh(i,j,v);
zlim([0 60]);
title('RBF������ͼ��');
%���ͼ��
subplot(1,3,3);mesh(x1,x2,F-v);
zlim([0 60]);
title('���ͼ��');
