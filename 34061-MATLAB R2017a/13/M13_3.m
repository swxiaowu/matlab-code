 clear all;
bw=imread('text.png');
%从图像中抽取字母a的图像
a=bw(32:45,88:98);
subplot(2,2,1);imshow(bw);
xlabel('(a)原始图像');
subplot(2,2,2);imshow(a);
xlabel('(b)显示“a”图');
C=real(ifft2(fft2(bw).*fft2(rot90(a,2),256,256)));
subplot(2,2,3);imshow(C,[]);
xlabel('(c)定位图');
%选择一个略小于C中最大值的值作为阈值
max(C(:));
thresh=60;
subplot(2,2,4);imshow(C>thresh);  %显示像素值超过阈值的点
xlabel('(d)提取“a”图');

