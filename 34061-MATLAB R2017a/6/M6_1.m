 clear all;
 x=zeros(1,30);
 [xm1,fv1]=PSO(@fitness,50,1.5,2.5,0.5,100,30)
 [xm2,fv2]=PSO(@fitness,50,1.5,2.5,0.5,1000,30)
 [xm3,fv3]=PSO(@fitness,50,1.5,2.5,0.5,10000,30)


 clear all;
 x=zeros(1,30);
 [xm4,fv4]=PSO(@fitness,10,1.5,2.5,0.5,100,30)
 [xm5,fv5]=PSO(@fitness,100,1.5,2.5,0.5,100,30)
 [xm6,fv6]=PSO(@fitness,500,1.5,2.5,0.5,100,30)
