clear all;
P = peaks(20);
X = repmat(P,[5 10]);
subplot(1,2,1);imagesc(X)
title('ԭʼͼ��');
Y = fft2(X);
subplot(1,2,2);imagesc(abs(fftshift(Y)))
title('�任���ͼ��');
