function m=meanf(x)
nans=isnan(x);
x(nans)=0;
n=sum(~nans);
n(n==0)=NaN;  %�澯
m=sum(x)./n;  %��ƽ��
