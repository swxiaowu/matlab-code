 clear all;
student=struct('name',{'LinNing','WuMing'},'number',{'20170706','20170707'},...
    'sex',{'f','m'},'age',{25,22});
a=fieldnames(student);  %��ȡstudent���г�Ա��
b=getfield(student,{1,2},'name');  %��ȡָ����Ա����
c=isfield(student,'sex');  %�ж�sex�Ƿ�Ϊstudent�еĳ�Ա
d=orderfields(student);  %���ṹ���Ա����ĸ��������
e=rmfield(student,'sex'); %ɾ��sex
s1=setfield(student(1,1),'sex','M');  %��������student�е�sex����
s2=setfield(student(1,2),'sex','F');  %��������student�е�sex����
