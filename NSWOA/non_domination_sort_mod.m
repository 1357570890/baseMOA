%% Cited from NSGA-II All rights reserved.
function f = non_domination_sort_mod(x, M, D)

%% function f = non_domination_sort_mod(x, M, D)
% This function sort the current popultion based on non-domination. All the
% individuals in the first front are given a rank of 1, the second front
% individuals are assigned rank 2 and so on. After assigning the rank the
% crowding in each front is calculated.

[N, ~] = size(x);

% Initialize the front number to 1.
front = 1;

% There is nothing to this assignment, used only to manipulate easily in
% MATLAB.
F(front).f = [];
individual = [];

%% Non-Dominated sort. 
% The initialized population is sorted based on non-domination. 
for i = 1 : N
    % Number of individuals that dominate this individual
    individual(i).n = 0;
    % Individuals which this individual dominate
    individual(i).p = [];
    for j = 1 : N
        dom_less = 0;
        dom_equal = 0;
        dom_more = 0;
        for k = 1 : M
            if (x(i,D + k) < x(j,D + k))
                dom_less = dom_less + 1;
            elseif (x(i,D + k) == x(j,D + k))
                dom_equal = dom_equal + 1;
            else
                dom_more = dom_more + 1;
            end
        end
        if dom_less == 0 && dom_equal ~= M
            individual(i).n = individual(i).n + 1;
        elseif dom_more == 0 && dom_equal ~= M
            individual(i).p = [individual(i).p j];
        end
    end   % end for j (N)
    if individual(i).n == 0
        x(i,M + D + 1) = 1;
        F(front).f = [F(front).f i];
    end
end % end for i (N)
% Find the subsequent fronts
while ~isempty(F(front).f)
   Q = [];
   for i = 1 : length(F(front).f)
       if ~isempty(individual(F(front).f(i)).p)
        	for j = 1 : length(individual(F(front).f(i)).p)
            	individual(individual(F(front).f(i)).p(j)).n = ...
                	individual(individual(F(front).f(i)).p(j)).n - 1;
        	   	if individual(individual(F(front).f(i)).p(j)).n == 0
               		x(individual(F(front).f(i)).p(j),M + D + 1) = ...
                        front + 1;
                    Q = [Q individual(F(front).f(i)).p(j)];
                end
            end
       end
   end
   front =  front + 1;
   F(front).f = Q;
end

sorted_based_on_front = sortrows(x,M+D+1); % sort follow front
current_index = 0;

%% Crowding distance
% Find the crowding distance for each individual in each front
for front = 1 : (length(F) - 1)
    y = [];
    previous_index = current_index + 1;
    for i = 1 : length(F(front).f)
        y(i,:) = sorted_based_on_front(current_index + i,:);
    end
    current_index = current_index + i;            
    for i = 1 : M
        [sorted_based_on_objective, index_of_objectives] = sortrows(y,D + i);       
        f_max = ...
            sorted_based_on_objective(length(index_of_objectives), D + i);
        f_min = sorted_based_on_objective(1, D + i);
        y(index_of_objectives(length(index_of_objectives)),M + D + 1 + i)...
            = Inf;
        y(index_of_objectives(1),M + D + 1 + i) = Inf;
         for j = 2 : length(index_of_objectives) - 1
            next_obj  = sorted_based_on_objective(j + 1,D + i);
            previous_obj  = sorted_based_on_objective(j - 1,D + i);
            if (f_max - f_min == 0)
                y(index_of_objectives(j),M + D + 1 + i) = Inf;
            else
                y(index_of_objectives(j),M + D + 1 + i) = ...
                     (next_obj - previous_obj)/(f_max - f_min);
            end
         end % end for j
    end % end for i
    distance = [];
    distance(:,1) = zeros(length(F(front).f),1);
    for i = 1 : M
        distance(:,1) = distance(:,1) + y(:,M + D + 1 + i);
    end
    y(:,M + D + 2) = distance;
    y = y(:,1 : M + D + 2);
    z(previous_index:current_index,:) = y;
end
f = z;