 clear all;
snr = 3; init = 2055615866; 
%创建一个标准的高斯白噪声
[xref,x] = wnoise(3,11,snr,init);
%一维信号的自动消噪处理
lev = 5;
xd = wden(x,'heursure','s','one',lev,'sym8');
% 绘制信号
subplot(711), plot(xref);
axis([1 2048 -10 10]);            %标注坐标
title('原始信号'); 
subplot(712), plot(x);
axis([1 2048 -10 10]); 
title(['噪声信号-信号比',num2str(fix(snr))]); 
subplot(713), plot(xd);
axis([1 2048 -10 10]); 
title('去噪后的信号-启动式阈值选择SURE'); 
%使用软阈值消噪
xd = wden(x,'heursure','s','one',lev,'sym8');
% 绘制信号
subplot(714), plot(xd);
axis([1 2048 -10 10]); 
title('去噪后的信号 - SURE');
%采用阈值sqrt(2*log)去噪
xd = wden(x,'sqtwolog','s','sln',lev,'sym8');
% 绘制信号
subplot(715), plot(xd);
axis([1 2048 -10 10]); 
title('去噪后的信号- 固定式阈值');
%采用极大极小阈值去噪
xd = wden(x,'minimaxi','s','sln',lev,'sym8');
% 绘制信号
subplot(716), plot(xd);
axis([1 2048 -10 10]); 
title('去噪后的信号-极大极小阈值');
%信号分解
[c,l] = wavedec(x,lev,'sym8');
% 阈值的分解结构[C,L]
xd = wden(c,l,'minimaxi','s','sln',lev,'sym8');
subplot(717), plot(xd);
axis([1 2048 -10 10]); 
title('去噪后的信号-信号分解');
