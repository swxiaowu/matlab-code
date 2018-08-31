function [xm,fv]=PSO_linear(fitness,N,c1,c2,wmax,wmin,M,D)
%fitness为适应度函数；
%N为种群个数；
%c1，c2为粒子群参数
%wmax为最大权重；
%wmin为最小权重；
%M为循环迭代步数；
%D为种群中个体个数
format long;
%初始化种群的个体
for i=1:N
    for j=1:D
        x(i,j)=randn;       %随机初始化位置
        v(i,j)=randn;      %随机初始化位置
    end
end
%先计算各个粒子的适应度
for i=1:N
    p(i)=fitness(x(i,:));
    y(i,:)=x(i,:);
end
pg=x(N,:);  %pg为全局最优
for i=1:(N-1)
    if fitness(x(i,:))<fitness(pg)
        pg=x(i,:);
    end
end
%进入主要循环
for t=1:M
    for j=1:N
        fv(j)=fitness(x(j,:));
    end
    fvag=sum(fv)/N;
    fmin=min(fv);
    for i=1:N
        if fv(i)<=fvag  %线性加权
            w=wmin+(fv(i)-fmin)*(wmax-wmin)/(fvag-fmin);
        else
            w=wmax;
        end
        v(i,:)=w*v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:));
        x(i,:)=x(i,:)+v(i,:);
        if fitness(x(i,:))<p(i)
            p(i)=fitness(x(i,:));
            y(i,:)=x(i,:);
        end
        if p(i)<fitness(pg)
            pg=y(i,:);
        end
    end
    pbest(t)=fitness(pg);
end
xm=pg';
fv=fitness(pg);
