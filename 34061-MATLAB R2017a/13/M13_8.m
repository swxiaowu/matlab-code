 clear all;
snr = 3; init = 2055615866; 
%����һ����׼�ĸ�˹������
[xref,x] = wnoise(3,11,snr,init);
%һά�źŵ��Զ����봦��
lev = 5;
xd = wden(x,'heursure','s','one',lev,'sym8');
% �����ź�
subplot(711), plot(xref);
axis([1 2048 -10 10]);            %��ע����
title('ԭʼ�ź�'); 
subplot(712), plot(x);
axis([1 2048 -10 10]); 
title(['�����ź�-�źű�',num2str(fix(snr))]); 
subplot(713), plot(xd);
axis([1 2048 -10 10]); 
title('ȥ�����ź�-����ʽ��ֵѡ��SURE'); 
%ʹ������ֵ����
xd = wden(x,'heursure','s','one',lev,'sym8');
% �����ź�
subplot(714), plot(xd);
axis([1 2048 -10 10]); 
title('ȥ�����ź� - SURE');
%������ֵsqrt(2*log)ȥ��
xd = wden(x,'sqtwolog','s','sln',lev,'sym8');
% �����ź�
subplot(715), plot(xd);
axis([1 2048 -10 10]); 
title('ȥ�����ź�- �̶�ʽ��ֵ');
%���ü���С��ֵȥ��
xd = wden(x,'minimaxi','s','sln',lev,'sym8');
% �����ź�
subplot(716), plot(xd);
axis([1 2048 -10 10]); 
title('ȥ�����ź�-����С��ֵ');
%�źŷֽ�
[c,l] = wavedec(x,lev,'sym8');
% ��ֵ�ķֽ�ṹ[C,L]
xd = wden(c,l,'minimaxi','s','sln',lev,'sym8');
subplot(717), plot(xd);
axis([1 2048 -10 10]); 
title('ȥ�����ź�-�źŷֽ�');
