%产生[2^n 2^(n-1)...1]的行向量，然后求和，将二进制转化为十进制
function pop2=decodebinary(pop)
[px,py]=size(pop);  %求pop行和列
for i=1:py
    pop1(:,i)=2.^(py-1).*pop(:,i);
    %pop的每一个向量（二进制表示），for循环将每个二进制行向量按位置乘上权值
    py=py-1;
end
pop2=sum(pop1,2);
%求pop1的每行之和，即得到每行二进制表示变为十进制表示值，实现二进制的转变
end
