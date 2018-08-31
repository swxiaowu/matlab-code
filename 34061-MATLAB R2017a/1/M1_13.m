 clear all;
student{1,1}={'LiNing','WuMing'};  %直接赋值法建立元胞数组
student{1,2}={'20140706','20170707'};
student{2,1}={'f','m'};
student{2,2}={25,22};
student;
student{1,1};
student{2,2};
cellplot(student);    %得到student元胞数组结构图，如图1-12所示

%利用cell函数创建元胞数组
clear all;
student=cell(2);
student{1,1}={'LiNing','WuMing'};  %直接赋值法建立元胞数组
student{1,2}={'20140706','20170707'};
student{2,1}={'f','m'};
student{2,2}={25,22};
student;
cellplot(student);    %得到student元胞数组结构图，与图1-12相同
