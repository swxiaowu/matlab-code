clear all;
popsize=20;      %Ⱥ���С
chromlength=10;  %�ַ������ȣ����峤�ȣ�
pc=0.7;  %�������
pm=0.005;  %�������
pop=initpop(popsize,chromlength);  %���������ʼȺ��
for i=1:20   %20Ϊ��������
    value=calobjvalue(pop);  %����Ŀ�꺯��
    fitvalue=calfitvalue(value);  %����Ⱥ����ÿ���������Ӧ��
    newpop=selection(pop,fitvalue);  %����
    newpop=crossover(pop,pc); %����
    newpop=mutation(pop,pc);  %����
  [bestindividual,bestfit]=best(pop,fitvalue);%���Ⱥ������Ӧֵ���ĸ��弰����Ӧֵ
    y(i)=max(bestfit);
    n(i)=i;
    pop3=bestindividual;
    x(i)=decodechrom(pop3,1,chromlength)*10/1023;
    pop=newpop;
end
fplot('9*sin(5*x)+8*cos(4*x)');
hold on;
plot(x,y,'r+');
hold off;
