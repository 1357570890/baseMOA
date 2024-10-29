%% PopObj：算法求得的pareto解集
%% PF：真实的解集
% 收敛性指标：GD测量了所有生成解与真实前沿解之间的平均欧几里得距离，
function Score = GD(PopObj,PF)
% Generational distance
    Distance = min(pdist2(PopObj,PF),[],2);
    Score  = norm(Distance) / length(Distance);
end