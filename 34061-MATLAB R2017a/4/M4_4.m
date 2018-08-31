clear all;
SamNum=100;         %��������
TestSamNum=101;  %����������
InDim=1; %��������ά��
ClusterNum=10;   %���ڵ�����������������
Overlap=1.0;  %���ڵ�����������������
%����Ŀ�꺯����������������
rand('state',sum(100*clock))
NoiseVar=0.1;
Noise=NoiseVar*randn(1,SamNum);
SamIn=8*rand(1,SamNum)-4;
SamOutNoNoise=1.1*(1-SamIn+2*SamIn.^2).*exp(-SamIn.^2/2);
SamOut=SamOutNoNoise+Noise;
TestSamIn=-4:0.08:4;
TestSamOut=1.1*(1-TestSamIn+2*TestSamIn.^2).*exp(-TestSamIn.^2/2);
figure;
hold on;
grid 
plot(SamIn,SamOut,'k+');
plot(TestSamIn,TestSamOut,'r--');
xlabel('����x');ylabel('���y');
Centers=SamIn(:,1:ClusterNum);
NumberInClusters=zeros(ClusterNum,1);  %�����е�����������ʼ��Ϊ��
IndexClusters=zeros(ClusterNum,SamNum);  %��������������������
while 1
    NumberInClusters=zeros(ClusterNum,1);  %�����е�����������ʼ��Ϊ��
    IndexInClusters=zeros(ClusterNum,SamNum); %��������������������
    %����С����ԭ��������������з���
    for i=1:SamNum
        AllDistance=dist(Centers',SamIn(:,i));
        [MinDist,Pos]=min(AllDistance);
        NumberInClusters(Pos)=NumberInClusters(Pos)+1;
        IndexInClusters(Pos,NumberInClusters(Pos))=i;
    end
    %����ɵľ�������
    OldCenters=Centers;
    for i=1:ClusterNum
        Index=IndexInClusters(i,1:NumberInClusters(i));
        Centers(:,i)=mean(SamIn(:,Index)')';
    end
    %�ж��¾ɾ��������Ƿ�һ�£������������
    EqualNum=sum(sum(Centers==OldCenters));
    if EqualNum==InDim*ClusterNum;
        break;
    end
end
%��������ڵ����չ��������ȣ�
AllDistances=dist(Centers',Centers);  %�������ڵ��������ļ�ľ��루����
Maximum=max(max(AllDistances));  %�ҳ���������һ������
for i=1:ClusterNum  %���Խ����ϵ�0�滻Ϊ�ϴ��ֵ
    AllDistances(i,i)=Maximum+1;
end
Spreads=Overlap*min(AllDistances)';  %�����ڵ�����С������Ϊ��չ����
%��������ڵ�����Ȩֵ
Distance=dist(Centers',SamIn);  %�����������������������ĵľ���
SpreadsMat=repmat(Spreads,1,SamNum);
HiddenUnitOut=radbas(Distance./SpreadsMat);  %�������ڵ������
HiddenUnitOutEx=[HiddenUnitOut',ones(SamNum,1)]';  %����ƫ��
W2Ex=SamOut*pinv(HiddenUnitOutEx);  %��������Ȩֵ
W2=W2Ex(:,1:ClusterNum);  %���Ȩֵ
B2=W2Ex(:,ClusterNum+1);  %ƫ��
%����
TestDistance=dist(Centers',TestSamIn);
TestSpreadsMat=repmat(Spreads,1,TestSamNum);
TestHiddenUnitOut=radbas(TestDistance./TestSpreadsMat);
TestNNout=W2*TestHiddenUnitOut+B2;
plot(TestSamIn,TestNNout,'r+');
W2,B2



clear all;
SamNum = 100;    %ѵ��������
TargetSamNum = 101;  %����������
InDim = 1;     %��������ά��
UnitNum = 10;   %���ڵ���
MaxEpoch = 5000;   %���ѵ������
E0 = 0.9; % Ŀ�����
%����Ŀ�꺯����������������
rand('state',sum(100*clock))
NoiseVar = 0.1;
Noise = NoiseVar*randn(1,SamNum);
SamIn = 8*rand(1,SamNum)-4;
SamOutNoNoise = 1.1*(1-SamIn+2*SamIn.^2).*exp(-SamIn.^2/2);
SamOut = SamOutNoNoise + Noise;
TargetIn = -4:0.08:4;
TargetOut = 1.1*(1-TargetIn+2*TargetIn.^2).*exp(-TargetIn.^2/2);
figure
hold on
grid
plot(SamIn,SamOut,'k+')
plot(TargetIn,TargetOut,'r--')
xlabel('����x');
ylabel('���y');
Center = 8*rand(InDim,UnitNum)-4;
SP = 0.2*rand(1,UnitNum)+0.1;
W = 0.2*rand(1,UnitNum)-0.1;
lrCent = 0.001;   %���ڵ���������ѧϰϵ��
lrSP = 0.001;   %���ڵ���չ����ѧϰϵ��
lrW = 0.001;   %���ڵ����Ȩֵѧϰϵ��
ErrHistory = [];   %���ڼ�¼ÿ�β����������ѵ�����
for epoch = 1:MaxEpoch
AllDist = dist(Center',SamIn);
SPMat = repmat(SP',1,SamNum);
UnitOut = radbas(AllDist./SPMat);
NetOut = W*UnitOut;
Error = SamOut-NetOut;
%ֹͣѧϰ�ж�
SSE = sumsqr(Error)
%��¼ÿ��Ȩֵ�������ѵ�����
ErrHistory = [ErrHistory SSE];
if SSE<E0
    break
end
for i = 1:UnitNum
    CentGrad = (SamIn-repmat(Center(:,i),1,SamNum))*(Error.*UnitOut(i,:)*W(i)/(SP(i)^2))';
    SPGrad = AllDist(i,:).^2*(Error.*UnitOut(i,:)*W(i)/(SP(i)^3))';
    WGrad = Error*UnitOut(i,:)';
    Center(:,i) = Center(:,i) + lrCent*CentGrad;
    SP(i) = SP(i) + lrSP*SPGrad;
    W(i) = W(i) + lrW*WGrad;
end
%����
TestDistance = dist(Center',TargetIn);
TestSpreadsMat = repmat(SP',1,TargetSamNum);
TestHiddenUnitOut = radbas(TestDistance./TestSpreadsMat);
TestNNOut = W*TestHiddenUnitOut;
plot(TargetIn,TestNNOut,'k-')
%����ѧϰ�������
figure
hold on
grid
[xx,Num] = size(ErrHistory);
plot(1:Num,ErrHistory,'k-');


 clear all;
SamNum = 100; %ѵ��������
TestSamNum = 101; %����������
SP = 0.6; %���ڵ���չ����
ErrorLimit = 0.9; %Ŀ�����
%����Ŀ�꺯����������������
rand('state',sum(100*clock))
NoiseVar = 0.1;
Noise = NoiseVar*randn(1,SamNum);
SamIn = 8*rand(1,SamNum)-4;
SamOutNoNoise = 1.1*(1-SamIn+2*SamIn.^2).*exp(-SamIn.^2/2);
SamOut = SamOutNoNoise + Noise;
TestSamIn = -4:0.08:4;
TestSamOut = 1.1*(1-TestSamIn+2*TestSamIn.^2).*exp(-TestSamIn.^2/2);
figure
hold on
grid
plot(SamIn,SamOut,'r+')
plot(TestSamIn,TestSamOut,'k--')
xlabel('����x');
ylabel('��� y');
[InDim,MaxUnitNum] = size(SamIn); %��������ά��������������ڵ���
%�������ڵ������
Distance = dist(SamIn',SamIn);
HiddenUnitOut = radbas(Distance/SP);
PosSelected = [];
VectorsSelected = [];
HiddenUnitOutSelected = [];
ErrHistory = []; %���ڼ�¼ÿ���������ڵ���ѵ�����
VectorsSelectFrom = HiddenUnitOut;
dd = sum((SamOut.*SamOut)')';
for k = 1 : MaxUnitNum
    %��������ڵ����ʸ����Ŀ�����ʸ���ļн�ƽ��ֵ
    PP = sum(VectorsSelectFrom.*VectorsSelectFrom)';
    Denominator = dd * PP';
    [xxx,SelectedNum] = size(PosSelected);
    if SelectedNum>0,
        [lin,xxx] = size(Denominator);
        Denominator(:,PosSelected) = ones(lin,1);
    end
    Angle = ((SamOut*VectorsSelectFrom) .^ 2) ./ Denominator;
    %ѡ��������ͶӰ��ʸ�����õ���Ӧ����������
    [value,pos] = max(Angle);
    PosSelected = [PosSelected pos];
    % ����RBF ��ѵ�����
    HiddenUnitOutSelected = [HiddenUnitOutSelected; HiddenUnitOut(pos,:)];
    HiddenUnitOutEx = [HiddenUnitOutSelected; ones(1,SamNum)];
    W2Ex = SamOut*pinv(HiddenUnitOutEx); %�ù�������������Ȩֵ
    W2 = W2Ex(:,1:k); %�õ����Ȩֵ
    B2 = W2Ex(:,k+1); %�õ�ƫ��
    NNOut = W2*HiddenUnitOutSelected+B2; % ����RBF �����
    SSE = sumsqr(SamOut-NNOut)
    %��¼ÿ���������ڵ���ѵ�����
    ErrHistory = [ErrHistory SSE];
    if SSE < ErrorLimit,
        break, 
    end
    %��Gram-Schmidt ������
    NewVector = VectorsSelectFrom(:,pos);
    ProjectionLen = NewVector' * VectorsSelectFrom / (NewVector'*NewVector);
    VectorsSelectFrom = VectorsSelectFrom - NewVector * ProjectionLen;
end
UnitCenters = SamIn(PosSelected);
%����
TestDistance = dist(UnitCenters',TestSamIn);
TestHiddenUnitOut = radbas(TestDistance/SP);
TestNNOut = W2*TestHiddenUnitOut+B2;
plot(TestSamIn,TestNNOut,'k-')
k,UnitCenters,W2,B2
