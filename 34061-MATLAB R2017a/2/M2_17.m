clear all;
 for i=1:10
    a{i}=89+i;
    b{i}=79+i;
    c{i}=69+i;
    d{i}=59+i;
end
c=[d,c];
Name={'zhang','Lin','huang','chen','xu'};  %Ԫ������
Score={78,92,89,40,100};
Rank=cell(1,5);
%����һ������5��Ԫ�صĽṹ������S������������Name��Score��Rank��
S=struct('Name',Name,'Score',Score,'Rank',Rank);
%����ѧ���ķ����������Ӧ�ĵȼ���
for i=1:5
    switch S(i).Score
        case 100
            S(i).Rank='����';
        case a
            S(i).Rank='����';
        case b
            S(i).Rank='����';
        case c
            S(i).Rank='����';
        otherwise
            S(i).Rank='������';
    end
end
%��ѧ�����������÷֡��Ǽǵ���Ϣ��ӡ������
disp(['ѧ������   ','�÷�   ','�ȼ�']);
for i=1:5
    disp([S(i).Name,blanks(6),num2str(S(i).Score),blanks(6),S(i).Rank]);
end
