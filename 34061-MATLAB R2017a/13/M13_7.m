clear all;
load noisdopp;  %�����ź�
x=noisdopp;
%�����źż�������ǿ�ȣ�����ȫ����ֵ
[thr,sorh,keepapp]=ddencmp('den','wv',x);
%����ȫ����ֵ���ź�ȥ��
xd=wdencmp('gbl',x,'sym4',2,thr,sorh,keepapp);
%��sym4С�����ź���4��ֽ�
[c,l]=wavedec(x,4,'sym4');
%�õ�ÿ����εķֲ���ֵ
[thr1,nkeep]=wdcbm(c,l,2);
%���ݷֲ���ֵʹ������ֵ�������ź�ȥ��
[xd1,cxd,lxd,perf0,perfl2]=wdencmp('lvd',c,l,'sym4',4,thr1,'s');
%����ԭʼ�źź�ȥ����źŵ�ͼ�Σ�Ч����ͼ13-17��ʾ
subplot(311);plot(x);title('ԭʼ�ź�');
subplot(312);plot(xd);title('ʹ��ȫ����ֵȥ�����ź�');
subplot(313);plot(xd1);title('ʹ�÷ֲ���ֵȥ�����ź�');
%���ȥ���źŵ������ɷֺ���ԭ�źŵı�׼��
