%% PopObj：算法求得的pareto解集
%% PF：真实的解集
% 多样性指标：Spacing测量了所有解之间的最小欧几里得距离
function Score = Spacing(PopObj,PF)
Distance = pdist2(PopObj,PopObj,'cityblock');
    Distance(logical(eye(size(Distance,1)))) = inf;
    Score    = std(min(Distance,[],2));
end