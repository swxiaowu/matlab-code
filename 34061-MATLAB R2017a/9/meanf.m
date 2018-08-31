function m=meanf(x)
nans=isnan(x);
x(nans)=0;
n=sum(~nans);
n(n==0)=NaN;  %告警
m=sum(x)./n;  %求平均
