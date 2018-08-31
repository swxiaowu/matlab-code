clear all;
sys = readfis('tipper');
sys.rule = [];
%添加规则
rule1 = [1 1 1 1 1];
rule2 = [1 2 2 1 1];
ruleList = [rule1;rule2];
%将规则列表添加到FIS
sys = addrule(sys,ruleList);
showrule(sys)   %显示所添加的规则
