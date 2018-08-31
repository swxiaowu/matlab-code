 clear all;
student=struct('name',{'LinNing','WuMing'},'number',{'20170706','20170707'},...
    'sex',{'f','m'},'age',{25,22});
a=fieldnames(student);  %获取student所有成员名
b=getfield(student,{1,2},'name');  %获取指定成员内容
c=isfield(student,'sex');  %判断sex是否为student中的成员
d=orderfields(student);  %按结构体成员首字母重新排序
e=rmfield(student,'sex'); %删除sex
s1=setfield(student(1,1),'sex','M');  %重新设置student中的sex内容
s2=setfield(student(1,2),'sex','F');  %重新设置student中的sex内容
