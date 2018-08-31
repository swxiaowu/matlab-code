 clear all;
load cathe_1;
X1=X;
%调入第二幅模糊图像
load cathe_2;
X2=X;
%基于小波分解的图像融合
XFUS=wfusimg(X1,X2,'sym4',5,'max','max');  %基于小波分解的图像融合
colormap(map);  %设置色彩索引图
subplot(1,3,1);image(X1);
axis square;  %设置显示比例
title('模糊图1');
subplot(1,3,2);image(X2);
axis square;
title('模糊图2');
subplot(1,3,3);image(XFUS);
axis square;
title('融合后图像');
