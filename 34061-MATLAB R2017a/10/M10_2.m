clear all;
%% 免疫算法求函数最值
D=10;         %免疫个体维数
NP=100;     %免疫个体数目
high=20;   %取值上限
low=-20;  %取值下限
G=500;  %最大免疫代数
pm=0.75;  %变异概率
alfa=1;  %激励度系数
belta=1;  %激励度系数
detas=0.25;  %相似度阈值
gen=0;   %免疫代数
Nc1=10;  %克隆个数
deta0=1*high;  %邻域范围初值
%% 初始种群
f=rand(D,NP)*(high-low)+low;
for np=1:NP
    MSLL(np)=M10_2a(f(:,np));
end
%% 计算个体浓度和激励度
for np=1:NP
    for j=1:NP
        nd(j)=sum(sqrt((f(:,np)-f(:,j)).^2));
        if nd(j)<detas
            nd(j)=1;
        else
            nd(j)=0;
        end
    end
    ND(np)=sum(nd)/NP;
end
MSLL=alfa*MSLL-belta*ND;
%% 激励度按升序排列
[SortMSLL,Index]=sort(MSLL);
Sortf=f(:,Index);
%% 免疫循环
while gen<G
    for i=1:NP/2
        %选激励度前NP/2个个体进行免疫操作
        a=Sortf(:,i);
        Na=repmat(a,1,Nc1);
        deta=deta0/gen;
        for j=1:Nc1
            for ii=1:D
                %变异
                if rand<pm
                    Na(ii,j)=Na(ii,j)+(rand-0.5)*deta;
                end
                %边界条件处理
                if (Na(ii,j)>high)|(Na(ii,j)<low)
                    Na(ii,j)=rand*(high-low)+low;
                end
            end
        end
        Na(:,1)=Sortf(:,i);  %保留克隆源个体
        % 克隆抑制，保留亲和度最高的个体
        for j=1:Nc1
            NaMSLL(j)=M10_2a(Na(:,j));
        end
        [NaSortMSLL,Index]=sort(NaMSLL);
        aMSLL(i)=NaSortMSLL(1);
        NaSortf=Na(:,Index);
        af(:,i)=NaSortf(:,1);
    end
    %免疫种群激励度
    for np=1:NP/2
        for j=1:NP/2
            nda(j)=sum(sqrt((af(:,np)-af(:,j)).^2));
            if nda(j)<detas
                nda(j)=1;
            else
                nda(j)=0;
            end
        end
        aND(np)=sum(nda)/NP/2;
    end
    aMSLL=alfa*aMSLL-belta*aND;
    %种群刷新
    bf=rand(D,NP/2)*(high-low)+low;
    for np=1:NP/2
        bMSLL(np)=M10_2a(bf(:,np));
    end
    %新生成种群激励度
    for np=1:NP/2
        for j=1:NP/2
            ndc(j)=sum(sqrt((bf(:,np)-bf(:,j)).^2));
            if ndc(j)<detas
                ndc(j)=1;
            else
                ndc(j)=0;
            end
        end
        bND(np)=sum(ndc)/NP/2;
    end
    bMSLL=alfa*bMSLL-belta*bND;
    %免疫种群与新生种群合并
    f1=[af,bf];
    MSLL1=[aMSLL,bMSLL];
    [SortMSLL,Index]=sort(MSLL1);
    Sortf=f1(:,Index);
    gen=gen+1;
    trace(gen)=M10_2a(Sortf(:,1));
end
%% 输出优化结果
Bestf=Sortf(:,1);  %最优变量
trace(end);  %最优值
figure;plot(trace);
xlabel('迭代次数');ylabel('目标函数值');
title('亲和度进化曲线');
