 clear all;
stu(1).name='LinNing';  %ֱ�Ӵ����ṹ��stu
stu(1).number='20170706';
stu(1).sex='f';
stu(1).age=25;
stu(2).name='WuMing';
stu(2).number='20170707';
stu(2).sex='m';
stu(2).age=22;
%Ӧ��struct���������ṹ��student
student=struct('name',{'LinNing','WuMing'},'number',{'20170706','20170707'},...
    'sex',{'f','m'},'age',{25,22});
