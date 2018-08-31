clear all;
echo on;
%NEWFFΪ����һ���µ�ǰ��������
%TRAIN��BP���������ѵ��
%SIM��BP��������з���
pause  %���������ʼ
%PΪ����ʸ��
P=[-1:0.05:1];  %
randn('seed',78341223);
%TΪĿ��ʸ��
T=sin(2*pi*P)+0.1*randn(size(P));
%�����������ݵ�
plot(P,T,'+');
echo off;
hold on;
plot(P,sin(2*pi*P),':');
%���Ʋ�����������������
echo on
pause
%����һ���µ�ǰ��������
net=newff(minmax(P),[20,1],{'tansig','purelin'});
pause
echo off
disp('1. L-M�Ż��㷨 TRAINLM');
disp('2. ��Ҷ˹�����㷨 TRAINBR');
choice=input('��ѡ��ѵ���㷨��1��2����');
figure(gcf);
if(choice==1)
    echo on
    %����L-M�Ż��㷨TRAINLM
    net.trainFcn='trainlm';
    pause
    %����ѵ������
    net.trainParam.epochs=500;
    net.tranParam.goal=1e-6;
    net=init(net);
    %���³�ʼ��
    pause
elseif(choice==2)
    echo on
    %���ñ�Ҷ˹�����㷨TRAINBR
    net.trainFcn='trainbr';
    pause
    %����ѵ������
    net.trainParam.epochs=500;
    randn('seed',192736547);
    net=init(net);
    % ���³�ʼ��
    pause
end
