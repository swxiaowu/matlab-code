%����ľۺ���Ӧ�Ⱥ���
function  f=fit(A,fitness)
t=0.8;
[m,m]=size(A);
k=-0.85;
for i=1:m
    n=0;
    for j=1:m
        if A(i,j)>t
            n=n+1;
        end
    end
    C(1,i)=n/m;  %���㿹���Ũ��
end
f=fitness.*exp(k.*C);  %����ľۺ���Ӧ��
