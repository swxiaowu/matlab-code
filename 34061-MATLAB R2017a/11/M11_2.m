%���������㷨������ֵ����
clear all;
xu=5;      %�Ͻ�
xl=-5;     %�½�
L=randi([5 11],1,1);  %���ɳ���ȡ[5,11]֮��������
Ca=5;   %��������
G=200;  %�����㷨������������
w=1;    %����ӦȨ��ϵ��
tabu=[];   %���ɱ�
x0=rand(1,2)*(xu-xl)+xl;  %���������ʼ��
bestsofar.key=x0;  %���Ž�
xnow(1).key=x0;  %��ǰ��
%���Ž⺯��ֵ����ǰ�⺯��ֵ
bestsofar.value=M11_2fun(bestsofar.key);
xnow(1).value=M11_2fun(xnow(1).key);
g=1;

while g<G
    x_near=[];  %�����
    w=w*0.998;
    for i=1:Ca
        %���������
        x_temp=xnow(g).key;
        x1=x_temp(1);
        x2=x_temp(2);
        x_near(i,1)=x1+(2*rand-1)*w*(xu-xl);
        %�߽���������
        %�߽�����
        if x_near(i,1)<xl
            x_near(i,1)=xl;
        end
        if x_near(i,1)>xu
            x_near(i,1)=xu;
        end
        x_near(i,2)=x2+(2*rand-1)*w*(xu-xl);
        %�߽���������
        %�߽�����
         if x_near(i,2)<xl
            x_near(i,2)=xl;
        end
        if x_near(i,2)>xu
            x_near(i,2)=xu;
        end
        %����������ĺ���ֵ
        fitvalue_near(i)=M11_2fun(x_near(i,:));
    end
    %���������Ϊ��ѡ��
    temp=find(fitvalue_near==max(fitvalue_near));
    candidate(g).key=x_near(temp,:);
    candidate(g).value=M11_2fun(candidate(g).key);
    %��ѡ��͵�ǰ������ۺ�����
    delta1=candidate(g).value-xnow(g).value;
    %��ѡ���Ŀǰ���Ž�����ۺ�����
    delta2=candidate(g).value-bestsofar(g).value;
    %��ѡ�Ⲣû�иĽ��⣬�Ѻ�ѡ�⸳����һ�ε����ĵ�ǰ��
    if delta1<=0
        xnow(g+1).key=candidate(g).key;
        xnow(g+1).value=M11_2fun(xnow(g).key);
        %���½��ɱ�
        tabu=[tabu;xnow(g+1).key];
        if size(tabu,1)>L
            tabu(1,:)=[];
        end
        g=g+1;          %���½��ɱ�󣬵�����������1
        %�������ڵ�ǰ���иĽ�����Ӧ��Ŀǰ���Ž�Ƚ�
    else
        if delta2>0  %��ѡ���Ŀǰ���Ž���
            %�ѸĽ��⸳����һ�ε�����ǰ��
            xnow(g+1).key=candidate(g).key;
            xnow(g+1).value=M11_2fun(xnow(g+1).key);
            %���½��ɱ�
            tabu=[tabu;xnow(g+1).key];
            if size(tabu,1)>L
                tabu(1,:)=[];
            end
            
            %�ѸĽ��⸳����һ�ε�����Ŀǰ���Ž�
            %��������׼��
            bestsofar.key=candidate(g).key;
            bestsofar.value=M11_2fun(bestsofar.key);
            g=g+1;  %���½��ɱ�󣬵�����������1           
        else
            %�жϸĽ����Ƿ��ڽ��ɱ���
            [M,N]=size(tabu);
            r=0;
            for m=1:M
                if candidate(g).key(1)==tabu(m,1) & candidate(g).kdey(2)==tabu(m,1)
                    r=1;
                end
            end
            if r==0
                %�Ľ��ⲻ�ڽ��ɱ��У��ѸĽ��⸳����һ�ε����ĵ�ǰ��
                xnow(g+1).key=candidate(g).key;
                xnow(g+1).value=M11_2fun(xnow(g+1).key);
                %���½��ɱ�
                tabu=[tabu;xnow(g).key];
                if size(tabu,1)>L
                    tabu(1,:)=[];
                end
                g=g+1;  %���½��ɱ�󣬵�����������1
            else
                %����Ľ����ڽ��ɱ��У��õ�ǰ�����²��������
                xnow(g).key=xnow(g).key;
                xnow(g).value=M11_2fun(xnow(g).key);
            end
        end
    end
    trace(g)=M11_2fun(bestsofar.key);
end

bestsofar;  %���ű���������ֵ
figure;plot(trace);
xlabel('��������');ylabel('Ŀ�꺯��ֵ');title('������������ֵ����');
        
        