clear all;
load bust;            %װ�ز���ʾԭʼͼ��
%���뺬��
init=2055615866;
randn('seed',init);
X1=X+20*randn(size(X));
subplot(2,2,1);image(X1);
colormap(map);
title('ԭʼͼ��');
axis square;
%��С��db4��ͼ��X����һ��С�����ֽ�
T=wpdec2(X1,1,'db4');
%�ع�ͼ����Ʋ���
A=wprcoef(T,[1 0]);
subplot(2,2,2);image(A);
title('ͼ��Ľ��Ʋ���');
axis square;
%%ԭͼ��ı�Ե���
BW1 = edge(X1,'prewitt');
subplot(2,2,3);imshow(BW1);
title('ԭͼ��ı�Ե');
axis square;
%%ͼ����Ʋ��ֵı�Ե���
BW2= edge(A,'prewitt');
subplot(2,2,4);imshow(BW2);
title('ͼ����Ʋ��ֵı�Ե');
axis square;

