clear all;
s1='How are you!   ';   %创建s1字符串
s2='File,Thank you!';  %创建s2字符串
A=[s1 s2];  %合并字符数组
B=char(s1,s2);  %连接字符串s1和s2
C=strcat(s1,s2);   %横向连接字符串s1和s2
D=strvcat(s1,s2);  %纵向连接字符串s1和s2 =char
E=s2(6:15); %拆分截取字符串s2
