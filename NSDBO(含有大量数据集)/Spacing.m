function Score = Spacing(PopObj)
% <metric> <min>
% Spacing
%------------------------------- Reference --------------------------------
% J. R. Schott, Fault tolerant design using single and multicriteria
% genetic algorithm optimization, Master's thesis, Department of
% Aeronautics and Astronautics, Massachusetts Institute of Technology,
% 1995.
%------------------------------- Copyright --------------------------------
% Copyright (c) 2018-2019 BIMK Group. 
    Distance = pdist2(PopObj,PopObj,'cityblock');
    Distance(logical(eye(size(Distance,1)))) = inf;
    Score    = std(min(Distance,[],2));
end