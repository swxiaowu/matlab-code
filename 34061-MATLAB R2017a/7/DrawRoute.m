function DrawRoute(C,R)
% ��·��ͼ���Ӻ���
% C Coordinate�ڵ����꣬��һ��N��2�ľ���洢
% R Route ·��
N=length(R);
scatter(C(:,1),C(:,2));
hold on
plot([C(R(1),1),C(R(N),1)],[C(R(1),2),C(R(N),2)],'g')
hold on
for ii=2:N
plot([C(R(ii-1),1),C(R(ii),1)],[C(R(ii-1),2),C(R(ii),2)],'g')
hold on
end
title('�����������Ż���� ')
