clear all;
load wnoislop;  %����ԭʼ�ź�
s=wnoislop;
figure;
subplot(7,1,1);plot(s);
ylabel('s');axis tight;
%ʹ��db5С�����źŽ���6��ֽ�
[C,L]=wavedec(s,6,'db5');
for i=1:6
    %�Էֽ�ĵ�6�㵽��1��ĵ�Ƶϵ�������ع�
    a=wrcoef('a',C,L,'db5',7-i);
    subplot(7,1,i+1);plot(a);
    axis tight;
    ylabel(['a',num2str(7-i)]);
end
figure;
subplot(7,1,1);plot(s);
ylabel('s');axis tight;
for i=1:6
    %�Էֽ�ĵ�6�㵽��1��ĸ�Ƶϵ�������ع�
    d=wrcoef('d',C,L,'db5',7-i);
    subplot(7,1,i+1);plot(d);
    ylabel(['d',num2str(7-i)]);
    axis tight;
end

