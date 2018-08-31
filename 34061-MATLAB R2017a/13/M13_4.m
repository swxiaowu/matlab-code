clear all;
snr=4;  %设置信噪比
init=2055615866;  %设置随机数初值
[si,xi]=wnoise(1,11,snr,init);  %产生矩形波信号和含白噪声信号
lev=5;  
xd=wden(xi,'heursure','s','one',lev,'sym8');
figure;
subplot(2,3,1);plot(si);
axis([1 2048 -15 15]);
title('原始信号');
subplot(2,3,2);plot(xi);
axis([1 2048 -15 15]);
title('含噪声信号');
ssi=fft(si);
ssi=abs(ssi);
xxi=fft(xi);
absx=abs(xxi);
subplot(2,3,3);plot(ssi);
title('原始信号的频谱');
subplot(2,3,4);plot(absx);
title('含噪信号的频谱');  %进行低通滤波
indd2=200:1800;
xxi(indd2)=zeros(size(indd2));
xden=ifft(xxi);  %进行傅里叶逆变换
xden=real(xden); 
xden=abs(xden);
subplot(2,3,5);plot(xd);
axis([1 2048 -15 15]);
title('小波消噪后的信号');
subplot(2,3,6);plot(xden);
axis([1 2048 -15 15]);
title('傅里叶分析去噪后的信号');
