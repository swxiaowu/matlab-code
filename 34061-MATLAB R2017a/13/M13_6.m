 clear all;
load leleccum;   %载入信号
s=leleccum(2000:2800);  %采样点
subplot(411);plot(s);
title('原始信号');
%用db4小波对原信号进行3层分解
[c,l]=wavedec(s,3,'db4');
%指定不同阈值对系数进行处理
sorh='h';
keepapp=1;
thr=33;
[s1,CXC,LXC,PERF01,PERFL21]=wdencmp('gbl',c,l,'db4',3,thr,sorh,keepapp);
thr=23;
[s2,CXC,LXC,PERF02,PERFL23]=wdencmp('gbl',c,l,'db4',3,thr,sorh,keepapp);
thr=13;
[s3,CXC,LXC,PERF03,PERFL13]=wdencmp('gbl',c,l,'db4',3,thr,sorh,keepapp);
subplot(412);plot(s1);
grid on;
title('不同阈值对信号进行压缩处理');
xlabel(['能量剩余,num2str(PERFL21),零系数成分',num2str(PERF01)]);
subplot(413);plot(s2);
xlabel(['能量剩余,num2str(PERFL23),零系数成分',num2str(PERF02)]);
subplot(414);plot(s3);
xlabel(['能量剩余,num2str(PERFL13),零系数成分',num2str(PERF03)]);
