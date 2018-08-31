clear all;
load bust;            %装载并显示原始图像
%加入含噪
init=2055615866;
randn('seed',init);
X1=X+20*randn(size(X));
subplot(2,2,1);image(X1);
colormap(map);
title('原始图像');
axis square;
%用小波db4对图像X进行一层小波包分解
T=wpdec2(X1,1,'db4');
%重构图像近似部分
A=wprcoef(T,[1 0]);
subplot(2,2,2);image(A);
title('图像的近似部分');
axis square;
%%原图像的边缘检测
BW1 = edge(X1,'prewitt');
subplot(2,2,3);imshow(BW1);
title('原图像的边缘');
axis square;
%%图像近似部分的边缘检测
BW2= edge(A,'prewitt');
subplot(2,2,4);imshow(BW2);
title('图像近似部分的边缘');
axis square;

