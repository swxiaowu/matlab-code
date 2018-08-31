clear all;
global popsize length min max N code;
N=10;  %ÿ��Ⱦɫ�������ʮ���Ʊ���λ����
M=100; %��������
popsize=20;  %���ó�ʼ������Ⱥ���С
length=10;   %lengthΪÿ�λ���Ķ����Ʊ���λ��
chromlength=N*length;  %�ַ������ȣ����峤�ȣ���Ⱦɫ��Ķ����Ʊ��볤��
pm=0.7;
%���ý�����ʣ�ʵ���н�������Ƕ�ֵ����������ñ仯�Ľ�����ʿ��ñ��ʽ��ʾ
%����дһ��������ʺ���������������ѵ���õ���ֵ��Ϊ�������
pm=0.3;  %���ñ�����ʣ�ͬ��Ҳ������Ϊ�仯��
bound={-100*ones(popsize,1),zeros(popsize,1)};
min=bound{1};
max=bound{2};
pop=initpop(popsize,chromlength);
%���г�ʼ�����������������ʼȺ��
ymax=500;
K=1;
%�������ͱ��룬ÿһ��Ϊһ��!code(1,:),����; code(2,:),50%;code(3,:),100%
code=[-0.8180 -1.6201 -14.8590 -17.9706 -24.0737 -33.4498 -43.3949 -53.3849 ...
    -63.3451 -73.0295 -79.6806 -74.3230 -0.7791 -1.2697 -14.8682 -53.3849 ...
    -30.2779 -39.4852 -49.4172 -59.4058 -69.3676 -79.0657 -85.8789 -81.0905 ...
    -0.8571 -1.9871 -13.4385 -13.8463 -20.4918 -29.9230 -39.8724 -49.8629 ...
    -59.8215 -69.4926 -75.9868 -70.6706];
%���ù������ݱ���
unnoralcode=[-0.5164 -5.6743 -11.8376 -12.6813 -20.5298 -39.9828 -43.9340 ...
    -49.9246 -69.8820 -79.5433 -65.9248 -8.9759];
for i=1:3
    %3�ֹ���ģʽ��ÿ��ģʽӦ�ò���popsize�ּ���������壩��ÿ�ּ�����ĳ��Ⱥ͹��ϱ���ĳ�����ͬ
    for k=1:M   %�ж�ÿ��ģʽ��Ӧֵ
        objvalue=calobjvalue(pop,i);  %����Ŀ�꺯��
        fitvalue=calfitvalue(objvalue);
        favg(k)=sum(fitvalue)/popsize;  %����Ⱥ����ÿ���������Ӧ��
        newpop=selection(pop,fitvalue);
        objvalue=calobjvalue(newpop,i); %ѡ��
        newpop=crossover(newpop,pc,k);
        objvalue=calobjvalue(newpop,i);  %����
        newpop=mutation2(newpop,pm);
        objvalue=calobjvalue(newpop,i);  %����
        for j=1:N   %����
            temp(:,j)=decodechrom(newpop,1+(j-1)*length,length);
            %��newpopÿ�У����壩ÿ�У�ÿ�λ���ת����ʮ������
            x(:,j)=temp(:,j)/(2^length-1)*(max(j)-min(j))+min(j);
            %popsize��N���������е���ת��Ϊ���������
        end
        [bestindividual,bestfit]=best(newpop,fitvalue);
        %���Ⱥ������Ӧֵ���ĸ��弰����Ӧֵ
        if bestfit<ymax
            ymax=bestfit;
            K=k;
        end
        if ymax<10  %������ֵС���趨��ֵ��ֹͣ����
            X{i}=x;
            break;
        end
        if k==1
            fitvalue_for=fitvalue;
            x_for=x;
        end
        s=resultselect(fitvalue_for,fitvalue,x_for,x);
        fitvalue_for=fitvalue;
        x_for=x;
        pop=newpop;
    end
    X{i}=s;
    %��i����ϵ�popsize�������
    distance=0;
    %����unnoralcode����ÿһ����ϵĸ���
    for j=1:N
        distance=distance+(s(:,j)-unnoralcode(j)).^2; %���õ�N����ͬ�ľ���
    end
    distance=sqrt(distance);
    D=0;
    for p=1:popsize
        if distance(p)<40  %Ԥ����ֵ
            D=D+1;
        end
    end
    p(i)=D/popsize  %unnoralcode����ÿ�ֹ������͵ĸ���
end
X;  %���Ϊ(i*popsize)������������壩

