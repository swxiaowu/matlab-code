 clear all;
bw=imread('text.png');
%��ͼ���г�ȡ��ĸa��ͼ��
a=bw(32:45,88:98);
subplot(2,2,1);imshow(bw);
xlabel('(a)ԭʼͼ��');
subplot(2,2,2);imshow(a);
xlabel('(b)��ʾ��a��ͼ');
C=real(ifft2(fft2(bw).*fft2(rot90(a,2),256,256)));
subplot(2,2,3);imshow(C,[]);
xlabel('(c)��λͼ');
%ѡ��һ����С��C�����ֵ��ֵ��Ϊ��ֵ
max(C(:));
thresh=60;
subplot(2,2,4);imshow(C>thresh);  %��ʾ����ֵ������ֵ�ĵ�
xlabel('(d)��ȡ��a��ͼ');

