 clear all;
student{1,1}={'LiNing','WuMing'};  %ֱ�Ӹ�ֵ������Ԫ������
student{1,2}={'20140706','20170707'};
student{2,1}={'f','m'};
student{2,2}={25,22};
student;
student{1,1};
student{2,2};
cellplot(student);    %�õ�studentԪ������ṹͼ����ͼ1-12��ʾ

%����cell��������Ԫ������
clear all;
student=cell(2);
student{1,1}={'LiNing','WuMing'};  %ֱ�Ӹ�ֵ������Ԫ������
student{1,2}={'20140706','20170707'};
student{2,1}={'f','m'};
student{2,2}={25,22};
student;
cellplot(student);    %�õ�studentԪ������ṹͼ����ͼ1-12��ͬ
