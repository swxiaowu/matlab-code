 clear all;
I=imread('eight.tif');
J=double(I);
x=(257-J)./255;
S=imnoise(x,'gaussian',0,0.005);
d1=0.3.*[1,1,1;1,2,1;1,1,1];
J1=conv2(S,d1,'same');
d2=[0,-1,0;-1,5,-1;0,-1,0];
J2=conv2(S,d2,'same');
subplot(221);imshow(I);
title('ԭͼ��');
subplot(222);imshow(S);
title('���Ӹ�˹����ͼ��');
subplot(223);imshow(J1);
title('ȥ���ͼ��');
subplot(224);imshow(J2/max(max(J2))+J/255);
title('��Ե��ǿͼ��');
