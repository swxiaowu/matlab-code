 clear all;
N=20;  %���г���
n=0:N-1;  %ʱ��ȡ��
xn=cos(pi*n/6);  %��������
k=0:N-1;  %Ƶ��ȡ��
wn=exp(-j*2*pi/N);
nk=n'*k;
wnnk=wn.^nk;
xk=xn*wnnk  %����DFT
subplot(1,2,1);stem(n,xn);
title('��������DFT');
subplot(1,2,2);stem(k,abs(xk));
title('���е�DFT')
