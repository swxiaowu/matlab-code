 clear all;
stu_cell={'LiNing','20170706','M','25'};  %��������
celldisp(stu_cell)  %��ʾԪ������
fields={'name','number','sex','age'};  
stu_struct=cell2struct(stu_cell,fields,2);  %��Ԫ������ת���ɽṹ��
stu_struct;
a=iscell(stu_cell);  %�ж�stu_cell�Ƿ�ΪԪ������
b=iscell(stu_struct);   %�ж�stu_struct�Ƿ�ΪԪ������
stu_t=struct('name',{'LiNing','WuMing'},'number',{'20170706','20170707'},...
    'sex',{'f','m'},'age',{25,22});
stu_c=struct2cell(stu_t);
c={[1],[2 3 4];[5;8],[1 7 4;9 6 8]};   %����Ԫ������
m=cell2mat(c);  %��Ԫ������ϲ��ɾ���
M=[1 2 3 4 5;6 7 8 9 10;11 12 13 14 15;16 17 18 19 20];
c1=mat2cell(M,[2,2],[2,3]);  %��M��ֳ�Ԫ������
c2=num2cell(M); %��Mת����Ԫ������
figure;
subplot(1,2,1);cellplot(c1);
title('c1�ṹͼ');
subplot(1,2,2);cellplot(c2);
title(' c2�ṹͼ');
