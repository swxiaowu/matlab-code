clear all;
 for i=1:10
    a{i}=89+i;
    b{i}=79+i;
    c{i}=69+i;
    d{i}=59+i;
end
c=[d,c];
Name={'zhang','Lin','huang','chen','xu'};  %元胞数组
Score={78,92,89,40,100};
Rank=cell(1,5);
%创建一个含有5个元素的结构体数组S，它有三个域：Name、Score、Rank：
S=struct('Name',Name,'Score',Score,'Rank',Rank);
%根据学生的分数，求出相应的等级：
for i=1:5
    switch S(i).Score
        case 100
            S(i).Rank='满分';
        case a
            S(i).Rank='优秀';
        case b
            S(i).Rank='良好';
        case c
            S(i).Rank='及格';
        otherwise
            S(i).Rank='不及格';
    end
end
%将学生的姓名、得分、登记等信息打印出来：
disp(['学生姓名   ','得分   ','等级']);
for i=1:5
    disp([S(i).Name,blanks(6),num2str(S(i).Score),blanks(6),S(i).Rank]);
end
