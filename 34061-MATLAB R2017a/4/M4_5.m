 clear all  %��ջ�������
%%ѵ����/���Լ�����
load water_data.mat   %��������,�����ݴ洢�ڹ���·����
% ���ݹ�һ��
attributes = mapminmax(attributes);
%ѵ������35������
P_train = attributes(:,1:35);
T_train = classes(:,1:35);
%���Լ���4������
P_test = attributes(:,36:end);
T_test = classes(:,36:end);
%% ���������紴����ѵ�����������
net = competlayer(4,0.01,0.01);  %��������
net.trainParam.epochs = 500;  % ����ѵ������
net = train(net,P_train);  %ѵ������
%�������
%ѵ����
t_sim_compet_1 = net(P_train);
T_sim_compet_1 = vec2ind(t_sim_compet_1);
%���Լ�
t_sim_compet_2 = net(P_test);
T_sim_compet_2 = vec2ind(t_sim_compet_2);
%%SOFM�����紴����ѵ�����������
net = selforgmap([4 4]);  %��������
net.trainParam.epochs = 200; %����ѵ������
net = train(net,P_train);  %ѵ������
%�������
%ѵ����
t_sim_sofm_1 = net(P_train);
T_sim_sofm_1 = vec2ind(t_sim_sofm_1);
%���Լ�
t_sim_sofm_2 = net(P_test);
T_sim_sofm_2 = vec2ind(t_sim_sofm_2)
%%����Ա�
%����������
result_compet_1 = [T_train' T_sim_compet_1']
result_compet_2 = [T_test' T_sim_compet_2']
%SOFM������
result_sofm_1 = [T_train' T_sim_sofm_1']
result_sofm_2 = [T_test' T_sim_sofm_2']
