clear all;
t=0:pi/20:2*pi;
y1=sin(t);
y2=sin(t-pi/2);
y3=sin(t-pi);
plot(t,y1,'-.r',t,y2,':mo',t,y3,'--bs');
%图形修饰
axis([0,2*pi,-1,1]);
xlabel('弧度值');
ylabel('函数值');
title('三条不同的正弦曲线');
legend('y1','y2','y3');
grid on;
gtext('y1=sin(t)');
gtext('y2=sin(t-pi/2)');
gtext('y3=sin(t-pi)');
