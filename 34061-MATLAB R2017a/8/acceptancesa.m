function acceptpoint = acceptancesa(optimValues,newx,newfval)    
%SAT���õ��½���ܺ������������ж��Ƿ����AnnealingFcn�����������½�
delE = newfval - optimValues.fval;  %�½��Ŀ�꺯��ֵ�뵱ǰ���Ŀ�꺯��ֵ֮��
% ����½�ȵ�ǰ��ã�Ҳ����˵���½��Ŀ�꺯��ֵ�ȵ�ǰ���С
if delE < 0
    acceptpoint = true;   %��ô���ܸ��½�
else   %������һ���ĸ��ʽ����½�
  %����һ���뵱ǰ�¶ȼ�delE�йص�ֵ
    h = 1/(1+exp(delE/max(optimValues.temperature)));  
    if h > rand   %�����ֵ���ڣ�0,1������������
        acceptpoint = true;  %��ô���ܸ��½�
    else
        acceptpoint = false;  %����ܾ����½�
    end
end
