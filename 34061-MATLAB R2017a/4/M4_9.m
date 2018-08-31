 clear all;
%�������Ŀ������T
T = [+1 -1; -1 +1];
%�ڶ�άƽ���ڻ��Ƴ��������ȶ�ƽ���
plot(T(1,:),T(2,:),'rp')             %Ч����ͼ4-38��ʾ
axis([-1.1 1.1 -1.1 1.1])
xlabel('a(1)');
ylabel('a(2)');
%�������缰����
net = newhop(T);              %���Hopfield����
[Y,Pf,Af] = net([],[],T);         %�������
Y
%�����ѡȡ��ʼ�㣬��������з���
a = {rands(2,1)};
[y,Pf,Af] = net({20},{},a);
%���Ƴ�ʼ����ƽ���ƽ�����
record = [cell2mat(a) cell2mat(y)];
start = cell2mat(a);
hold on
plot(start(1,1),start(2,1),'bx',record(1,:),record(2,:))   %Ч����ͼ4-39��ʾ
%�����ѡȡ25����ʼ����в���
color = 'rgbmy';
for i=1:25
   a = {rands(2,1)};
   [y,Pf,Af] = net({20},{},a);
   record=[cell2mat(a) cell2mat(y)];
   start=cell2mat(a);
   plot(start(1,1),start(2,1),'kx',record(1,:),record(2,:),color(rem(i,5)+1))
end