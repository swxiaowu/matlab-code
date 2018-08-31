 clear all;
stu_cell={'LiNing','20170706','M','25'};  %建立数组
celldisp(stu_cell)  %显示元胞数组
fields={'name','number','sex','age'};  
stu_struct=cell2struct(stu_cell,fields,2);  %将元胞数组转换成结构体
stu_struct;
a=iscell(stu_cell);  %判断stu_cell是否为元胞数组
b=iscell(stu_struct);   %判断stu_struct是否为元胞数组
stu_t=struct('name',{'LiNing','WuMing'},'number',{'20170706','20170707'},...
    'sex',{'f','m'},'age',{25,22});
stu_c=struct2cell(stu_t);
c={[1],[2 3 4];[5;8],[1 7 4;9 6 8]};   %建立元胞数组
m=cell2mat(c);  %将元胞数组合并成矩阵
M=[1 2 3 4 5;6 7 8 9 10;11 12 13 14 15;16 17 18 19 20];
c1=mat2cell(M,[2,2],[2,3]);  %将M拆分成元胞数组
c2=num2cell(M); %将M转换成元胞数组
figure;
subplot(1,2,1);cellplot(c1);
title('c1结构图');
subplot(1,2,2);cellplot(c2);
title(' c2结构图');
