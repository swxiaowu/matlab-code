 clear all;
load leleccum;   %�����ź�
s=leleccum(2000:2800);  %������
subplot(411);plot(s);
title('ԭʼ�ź�');
%��db4С����ԭ�źŽ���3��ֽ�
[c,l]=wavedec(s,3,'db4');
%ָ����ͬ��ֵ��ϵ�����д���
sorh='h';
keepapp=1;
thr=33;
[s1,CXC,LXC,PERF01,PERFL21]=wdencmp('gbl',c,l,'db4',3,thr,sorh,keepapp);
thr=23;
[s2,CXC,LXC,PERF02,PERFL23]=wdencmp('gbl',c,l,'db4',3,thr,sorh,keepapp);
thr=13;
[s3,CXC,LXC,PERF03,PERFL13]=wdencmp('gbl',c,l,'db4',3,thr,sorh,keepapp);
subplot(412);plot(s1);
grid on;
title('��ͬ��ֵ���źŽ���ѹ������');
xlabel(['����ʣ��,num2str(PERFL21),��ϵ���ɷ�',num2str(PERF01)]);
subplot(413);plot(s2);
xlabel(['����ʣ��,num2str(PERFL23),��ϵ���ɷ�',num2str(PERF02)]);
subplot(414);plot(s3);
xlabel(['����ʣ��,num2str(PERFL13),��ϵ���ɷ�',num2str(PERF03)]);
