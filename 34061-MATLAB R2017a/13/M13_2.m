clear all;
P = peaks(20);
X = repmat(P,[5 10]);
subplot(1,2,1);imagesc(X)
title('原始图像');
Y = fft2(X);
subplot(1,2,2);imagesc(abs(fftshift(Y)))
title('变换后的图像');
