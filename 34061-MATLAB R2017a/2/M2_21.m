clear all;
x=0:0.01:10;
y1=sin(2.*x);
y2=2.*sin(x);
figure(1);  %��һ��ͼ�δ���
subplot(1,2,1);plot(y1);  %�����ڷָ��1��2�������򣬷ֱ����y1��y2
subplot(1,2,2);plot(y2);
