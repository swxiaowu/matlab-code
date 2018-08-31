function [BestShortcut,theMinDistance]=TabuSearch
clear;
Clist=[1304 2312;3639 1315;4177 2244;3712 1399;3488 1535;3326 1556;3238 1229;...
    4196 1044;4312  790;4386  570;3007 1970;2562 1756;2788 1491;2381 1676;...
    1332  695;3715 1678;3918 2179;4061 2370;3780 2212;3676 2578;4029 2838;...
    4263 2931;3429 1908;3507 2376;3394 2643;3439 3201;2935 3240;3140 3550;...
    2545 2357;2778 2826;2370 2975];%ȫ��31��ʡ���������

CityNum=size(Clist,1);%TSP����Ĺ�ģ,��������Ŀ
dislist=zeros(CityNum); 
for i=1:CityNum
    for j=1:CityNum
        dislist(i,j)=((Clist(i,1)-Clist(j,1))^2+(Clist(i,2)-Clist(j,2))^2)^0.5;       
    end
end
TabuList=zeros(CityNum);                      % (tabu list)
TabuLength=round((CityNum*(CityNum-1)/2)^0.5);%���ɱ���(tabu length)
Candidates=200;                               %��ѡ���ĸ��� (ȫ����������)
CandidateNum=zeros(Candidates,CityNum);       %��ѡ�⼯��
S0=randperm(CityNum);                         %���������ʼ��
BSF=S0;                                       %best so far;
BestL=Inf;                                    %��ǰ��ѽ����
p=1;                                         %��¼��������
StopL=2000;                                  %����������

figure(1);
stop = uicontrol('style','toggle','string','stop','background','white');
tic;                                         %�������浱ǰʱ��
%��������ѭ��
while p<StopL
    if Candidates>CityNum*(CityNum-1)/2
        disp('��ѡ�����������n*(n-1)/2!');
        break;
    end
    ALong(p)=M11_1fun(dislist,S0);      %��ǰ������ֵ    
    i=1;
    A=zeros(Candidates,2);          % ���н����ĳ��о���
    %����while�� �����������200 X 2  �ľ������A��ÿһ��Ԫ�ض�����1-31֮���
    while i<=Candidates        
        M=CityNum*rand(1,2);
        M=ceil(M);
        if M(1)~=M(2)
            A(i,1)=max(M(1),M(2));
            A(i,2)=min(M(1),M(2));
                if i==1
                isa=0;
            else
                for j=1:i-1
                    if A(i,1)==A(j,1) && A(i,2)==A(j,2)
                        isa=1;
                        break;
                    else
                        isa=0;
                    end
                end
            end 
            if ~isa
               i=i+1;
            else 
            end            
        else 
        end
    end
    %���������
    BestCandidateNum=100;%����ǰBestCandidateNum����ú�ѡ��
    BestCandidate=Inf*ones(BestCandidateNum,4);
    F=zeros(1,Candidates);    
    %���൱���ǲ���һ��S0������...
    for i=1:Candidates
        CandidateNum(i,:)=S0;  %��ѡ�⼯�ϡ�
        CandidateNum(i,[A(i,2),A(i,1)])=S0([A(i,1),A(i,2)]);
        F(i)=M11_1fun(dislist,CandidateNum(i,:));
        if i<=BestCandidateNum
            BestCandidate(i,2)=F(i);
            BestCandidate(i,1)=i;
            BestCandidate(i,3)=S0(A(i,1));
            BestCandidate(i,4)=S0(A(i,2));   
        else
            for j=1:BestCandidateNum
                if F(i)<BestCandidate(j,2)
                    BestCandidate(j,2)=F(i);
                    BestCandidate(j,1)=i;
                    BestCandidate(j,3)=S0(A(i,1));
                    BestCandidate(j,4)=S0(A(i,2));
                    break;
                end            
            end
        end
    end
    %��BestCandidate 
    [JL,Index]=sort(BestCandidate(:,2)); 
    SBest=BestCandidate(Index,:);
    BestCandidate=SBest;
    %����׼��
      if BestCandidate(1,2)<BestL
        BestL=BestCandidate(1,2);
        S0=CandidateNum(BestCandidate(1,1),:);        
        BSF=S0;
        for m=1:CityNum
            for n=1:CityNum
                if TabuList(m,n)~=0
                    TabuList(m,n)=TabuList(m,n)-1;  %���½��ɱ�
                end
            end
        end
        TabuList(BestCandidate(1,3),BestCandidate(1,4))=TabuLength;  %���½��ɱ�
    else          
for i=1:BestCandidateNum
            if  TabuList(BestCandidate(i,3),BestCandidate(i,4))==0
                S0=CandidateNum(BestCandidate(i,1),:);                
            for m=1:CityNum
                for n=1:CityNum
                    if TabuList(m,n)~=0
                        TabuList(m,n)=TabuList(m,n)-1;      %���½��ɱ�
                    end
                end
            end        
           TabuList(BestCandidate(i,3),BestCandidate(i,4))=TabuLength; %���½��ɱ�
            break;
            end
        end
      end  
    ArrBestL(p)=BestL;      
    for i=1:CityNum-1
        plot([Clist(BSF(i),1),Clist(BSF(i+1),1)],[Clist(BSF(i),2),Clist(BSF(i+1),2)],'bo-');
        hold on;
    end
    plot([Clist(BSF(CityNum),1),Clist(BSF(1),1)],[Clist(BSF(CityNum),2),Clist(BSF(1),2)],'ro-');
    title(['��������:',int2str(p),' �Ż���̾���:',num2str(BestL)]);
    hold off;
    pause(0.005);
    if get(stop,'value')==1
        break;
    end
    %�洢�м���ΪͼƬ
    if (p==1||p==5||p==10||p==20||p==60||p==150||p==400||p==800||p==1500||p==2000)
        filename=num2str(p);
        fileformat='jpg';
        saveas(gcf,filename,fileformat);
    end 
    p=p+1;                                  %����������1
end
toc;                                         %�����������ʱ��
BestShortcut=BSF;                            %���·��
theMinDistance=BestL;                        %���·�߳���
set(stop,'style','pushbutton','string','close', 'callback','close(gcf)');
figure(2);
plot(ArrBestL,'b');
xlabel('��������');
ylabel('Ŀ�꺯��ֵ');
title('��Ӧ�Ƚ�������');
grid;
hold on;
figure(3)
plot(toc-tic,'b');
grid;
title('����ʱ��');
legend('Best So Far','��ǰ��');
