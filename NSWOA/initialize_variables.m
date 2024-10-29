%% Cited from NSGA-II All rights reserved.
function f = initialize_variables(NP, M, D, LB, UB)

%% function f = initialize_variables(N, M, D, LB, UB) 
% This function initializes the population. Each individual has the
% following at this stage
%       * set of decision variables
%       * objective function values
% 
% where,
% NP - Population size
% M - Number of objective functions
% D - Number of decision variables
% min_range - A vector of decimal values which indicate the minimum value
% for each decision variable.
% max_range - Vector of maximum possible values for decision variables.

min = LB;
max = UB;
K = M + D;
f=zeros(NP,K);

%% Initialize each individual in population
% For each chromosome perform the following (N is the population size)
for i = 1 : NP
    for j = 1 : D
        f(i,j) = min(j) + (max(j) - min(j))*rand(1);
    end % end for j
    f(i,D + 1: K) = evaluate_objective(f(i,1:D));
end % end for i