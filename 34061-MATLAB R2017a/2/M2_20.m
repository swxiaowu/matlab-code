clear all;
x = 0:pi/10:2*pi;  %x等于0-2*pi之间公差为pi/10的数列
y1 = sin(x);
y2 = sin(x-0.25);
y3 = sin(x-0.5);
figure %创建一个用来显示图形输出的一个窗口对象
plot(x,y1,'g',x,y2,'b--o',x,y3,'c*')  %在同一个图形窗口中绘制y1,y2,y3曲线
