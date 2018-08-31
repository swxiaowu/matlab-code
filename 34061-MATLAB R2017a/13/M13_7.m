clear all;
load noisdopp;  %载入信号
x=noisdopp;
%根据信号计算噪声强度，给出全局阈值
[thr,sorh,keepapp]=ddencmp('den','wv',x);
%根据全局阈值对信号去噪
xd=wdencmp('gbl',x,'sym4',2,thr,sorh,keepapp);
%用sym4小波对信号做4层分解
[c,l]=wavedec(x,4,'sym4');
%得到每个层次的分层阈值
[thr1,nkeep]=wdcbm(c,l,2);
%根据分层阈值使用软阈值方法对信号去噪
[xd1,cxd,lxd,perf0,perfl2]=wdencmp('lvd',c,l,'sym4',4,thr1,'s');
%绘制原始信号和去噪后信号的图形，效果如图13-17所示
subplot(311);plot(x);title('原始信号');
subplot(312);plot(xd);title('使用全局阈值去噪后的信号');
subplot(313);plot(xd1);title('使用分层阈值去噪后的信号');
%求得去噪信号的能量成分和与原信号的标准差
