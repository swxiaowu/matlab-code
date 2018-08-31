clear all;
num=randn(3,3);  %产生3×3随机矩阵
s1=num2str(num);  %将数值转换成字符串
s2=num2str(pi,10);  %将pi的前10位转换成字符串
int=45678;  
s3=int2str(int);  %将矩阵转换成字符串
s4=mat2str(pascal(3));  %将矩阵转换成字符串
num1=str2num('45678'); %将字符串转换成数值
num2=str2double('45678.123');  %将字符串转换成双精度浮点数
