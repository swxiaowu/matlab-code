 clear all;
load cathe_1;
X1=X;
%����ڶ���ģ��ͼ��
load cathe_2;
X2=X;
%����С���ֽ��ͼ���ں�
XFUS=wfusimg(X1,X2,'sym4',5,'max','max');  %����С���ֽ��ͼ���ں�
colormap(map);  %����ɫ������ͼ
subplot(1,3,1);image(X1);
axis square;  %������ʾ����
title('ģ��ͼ1');
subplot(1,3,2);image(X2);
axis square;
title('ģ��ͼ2');
subplot(1,3,3);image(XFUS);
axis square;
title('�ںϺ�ͼ��');
