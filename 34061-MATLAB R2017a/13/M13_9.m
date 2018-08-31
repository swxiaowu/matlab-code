clear all;
load noissin;  %װ��ԭʼnoissin�ź�
s=noissin;
subplot(6,1,1);plot(s);
ylabel('s');
%ʹ��db5С�����źŽ���5��ֽ�
[C,L]=wavedec(s,5,'db5');
for i=1:5
    %�Էֽ�ĵ�5�㵽��1��ĵ�Ƶϵ�������ع�
    A=wrcoef('A',C,L,'db5',6-i);
    subplot(6,1,i+1);plot(A);
    ylabel(['A',num2str(6-i)]);
end
figure;
subplot(6,1,1);plot(s);
ylabel('s');
for i=1:5
    %�Էֽ�ĵ�5�㵽��1��ĸ�Ƶϵ�������ع�
    D=wrcoef('D',C,L,'db5',6-i);
    subplot(6,1,i+1);plot(D);
    ylabel(['D',num2str(6-i)]);
end
