%将二进制编码转换成十进制，参数spoint表示待解码的二进制串的起始位置
%（对于多个变量而言，如有两个变量，采用20位表示，每个变量10位，则第一个变量从1开始，
%另一个变量从11开始，本实例为1）
function pop2=decodechrom(pop,spoint,length)
%length表示所截取的长度
pop1=pop(:,spoint:spoint+length-1);
%将从第“spoint”位开始到第“spoint+length-1”位（这段码位表示一个参数）取出
pop2=decodebinary(pop1);
%利用popsize×1列向量
