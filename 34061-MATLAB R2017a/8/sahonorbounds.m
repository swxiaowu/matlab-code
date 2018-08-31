function newx = sahonorbounds(newx,optimValues,problem)
%������ȷ���������½���������Լ����Χ��
if ~problem.bounded  %����û��Լ�����Ż����⣬��������
    return
end
xin = newx;    %�洢newx
newx = newx(:); %ת��Ϊ������
lb = problem.lb; %����Լ��
ub = problem.ub;  %����Լ��
lbound = newx < lb; %�鿴�Ƿ������޷�Χ֮��
ubound = newx > ub;  %�鿴�Ƿ������޷�Χ֮��
alpha = rand;  %������0,1������������
% ������Ա�������Լ����Χ��
if any(lbound) || any(ubound)
    projnewx = newx;  %��ʱ��projnewx����Լ����Χ��
    %���ĳ�Ա����������޷�Χ�������޷�Χֵ�������Ա�����
%ʹprojnewx��������Լ��
    projnewx(lbound) = lb(lbound); 
    %���ĳ�Ա����������޷�Χ�������޷�Χֵ�������Ա�����
%ʹprojnewx��������Լ��
    projnewx(ubound) = ub(ubound);
    %��ʱ��projnewx�պ���Լ����Χ�ڣ�optimValues.x����ǰ�⣬
%��˲�����newxһ������������Լ������
    newx = alpha*projnewx + (1-alpha)*optimValues.x(:);
    newx = reshapeinput(xin,newx); %��newxת����������
else
    newx = xin; %�����Լ����Χ�ڣ����ظղŴ洢��newx
end
