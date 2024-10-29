close all;
clear ; 
clc;
%%
TestProblem=5;%1-47
MultiObj = GetFunInfo(TestProblem);
MultiObjFnc=MultiObj.name;%问题名
% Parameters
params.Np = 300;        % Population size
params.Nr = 300;        % Repository size
params.maxgen =100;     % Maximum number of generations
numOfObj=MultiObj.numOfObj;%目标函数个数
D=MultiObj.nVar;%维度
f = NSDBO(params,MultiObj);
X=f(:,1:D);%PS
Obtained_Pareto=f(:,D+1:D+numOfObj);%PF
if(isfield(MultiObj,'truePF'))%判断是否有参考的PF
True_Pareto=MultiObj.truePF;
%%  Metric Value
% ResultData的值分别是IGD、GD、HV、Spacing  (HV越大越好，其他指标越小越好)
ResultData=[IGD(Obtained_Pareto,True_Pareto),GD(Obtained_Pareto,True_Pareto),HV(Obtained_Pareto,True_Pareto),Spacing(Obtained_Pareto)];
else
    %计算每个算法的Spacing，Spacing越小说明解集分布越均匀
    ResultData=Spacing(Obtained_Pareto);%计算的Spacing
end
%%
disp('Repository fitness values are stored in Obtained_Pareto');
disp('Repository particles positions are store in X');