function [xm,fv]=PSO_linear(fitness,N,c1,c2,wmax,wmin,M,D)
%fitnessΪ��Ӧ�Ⱥ�����
%NΪ��Ⱥ������
%c1��c2Ϊ����Ⱥ����
%wmaxΪ���Ȩ�أ�
%wminΪ��СȨ�أ�
%MΪѭ������������
%DΪ��Ⱥ�и������
format long;
%��ʼ����Ⱥ�ĸ���
for i=1:N
    for j=1:D
        x(i,j)=randn;       %�����ʼ��λ��
        v(i,j)=randn;      %�����ʼ��λ��
    end
end
%�ȼ���������ӵ���Ӧ��
for i=1:N
    p(i)=fitness(x(i,:));
    y(i,:)=x(i,:);
end
pg=x(N,:);  %pgΪȫ������
for i=1:(N-1)
    if fitness(x(i,:))<fitness(pg)
        pg=x(i,:);
    end
end
%������Ҫѭ��
for t=1:M
    for j=1:N
        fv(j)=fitness(x(j,:));
    end
    fvag=sum(fv)/N;
    fmin=min(fv);
    for i=1:N
        if fv(i)<=fvag  %���Լ�Ȩ
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