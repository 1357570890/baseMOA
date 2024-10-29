%% PopObj：算法求得的pareto解集
%% PF：真实的解集
% 收敛性指标：IGD测量了所有真实前沿解与生成解之间的平均欧几里得距离
function Score = IGD(PopObj,PF)
Distance = min(pdist2(PF,PopObj),[],2);
Score    = mean(Distance);
end