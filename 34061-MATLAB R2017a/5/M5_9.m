clear all;
sys = readfis('tipper');
sys.rule = [];
%��ӹ���
rule1 = [1 1 1 1 1];
rule2 = [1 2 2 1 1];
ruleList = [rule1;rule2];
%�������б���ӵ�FIS
sys = addrule(sys,ruleList);
showrule(sys)   %��ʾ����ӵĹ���
