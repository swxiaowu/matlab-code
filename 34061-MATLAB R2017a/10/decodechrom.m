%�������Ʊ���ת����ʮ���ƣ�����spoint��ʾ������Ķ����ƴ�����ʼλ��
%�����ڶ���������ԣ�������������������20λ��ʾ��ÿ������10λ�����һ��������1��ʼ��
%��һ��������11��ʼ����ʵ��Ϊ1��
function pop2=decodechrom(pop,spoint,length)
%length��ʾ����ȡ�ĳ���
pop1=pop(:,spoint:spoint+length-1);
%���ӵڡ�spoint��λ��ʼ���ڡ�spoint+length-1��λ�������λ��ʾһ��������ȡ��
pop2=decodebinary(pop1);
%����popsize��1������
