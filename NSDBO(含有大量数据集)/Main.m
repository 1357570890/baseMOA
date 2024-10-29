close all;
clear ; 
clc;
%%
TestProblem=5;%1-47
MultiObj = GetFunInfo(TestProblem);
MultiObjFnc=MultiObj.name;%������
% Parameters
params.Np = 300;        % Population size
params.Nr = 300;        % Repository size
params.maxgen =100;     % Maximum number of generations
numOfObj=MultiObj.numOfObj;%Ŀ�꺯������
D=MultiObj.nVar;%ά��
f = NSDBO(params,MultiObj);
X=f(:,1:D);%PS
Obtained_Pareto=f(:,D+1:D+numOfObj);%PF
if(isfield(MultiObj,'truePF'))%�ж��Ƿ��вο���PF
True_Pareto=MultiObj.truePF;
%%  Metric Value
% ResultData��ֵ�ֱ���IGD��GD��HV��Spacing  (HVԽ��Խ�ã�����ָ��ԽСԽ��)
ResultData=[IGD(Obtained_Pareto,True_Pareto),GD(Obtained_Pareto,True_Pareto),HV(Obtained_Pareto,True_Pareto),Spacing(Obtained_Pareto)];
else
    %����ÿ���㷨��Spacing��SpacingԽС˵���⼯�ֲ�Խ����
    ResultData=Spacing(Obtained_Pareto);%�����Spacing
end
%%
disp('Repository fitness values are stored in Obtained_Pareto');
disp('Repository particles positions are store in X');