function Score = GD(PopObj,PF)
% <metric> <min>
% Generational distance

%------------------------------- Reference --------------------------------
% D. A. Van Veldhuizen, Multiobjective evolutionary algorithms:
% Classifications, analyses, and new innovations, Ph.D. thesis, Department
% of Electrical and Computer Engineering, Graduate School of Engineering,
% Air Force Institute of Technology, Wright Patterson Air Force Base, 1999.
%------------------------------- Copyright --------------------------------
% Copyright (c) 2018-2019 BIMK Group. 
    Distance = min(pdist2(PopObj,PF),[],2);
    Score    = norm(Distance) / length(Distance);
end