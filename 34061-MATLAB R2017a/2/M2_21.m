clear all;
x=0:0.01:10;
y1=sin(2.*x);
y2=2.*sin(x);
figure(1);  %打开一个图形窗口
subplot(1,2,1);plot(y1);  %将窗口分割成1×2两个区域，分别绘制y1和y2
subplot(1,2,2);plot(y2);
