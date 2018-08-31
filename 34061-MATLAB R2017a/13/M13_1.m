 clear all;
N=20;  %序列长度
n=0:N-1;  %时域取样
xn=cos(pi*n/6);  %产生序列
k=0:N-1;  %频域取样
wn=exp(-j*2*pi/N);
nk=n'*k;
wnnk=wn.^nk;
xk=xn*wnnk  %计算DFT
subplot(1,2,1);stem(n,xn);
title('有限序列DFT');
subplot(1,2,2);stem(k,abs(xk));
title('序列的DFT')
