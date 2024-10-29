%% Objective Functionclc
clc
clear
close all
D = 30; % Number of decision variables
M = 2; % Number of objective functions
K=M+D;
LB = ones(1, D).*0; %  LB - A vector of decimal values which indicate the minimum value for each decision variable.
UB = ones(1, D).*1; % UB - Vector of maximum possible values for decision variables.
Max_iteration = 100;  % Set the maximum number of generation (GEN)
SearchAgents_no = 100;      % Set the population size (Search Agent)
ishow = 10;
%% Initialize the population
chromosome = initialize_variables(SearchAgents_no, M, D, LB, UB);
%% Sort the initialized population
intermediate_chromosome = non_domination_sort_mod(chromosome, M, D);
%% Perform Selection
Population = replace_chromosome(intermediate_chromosome, M,D,SearchAgents_no);
%% Start the evolution process
Pareto = NSWOA(D,M,LB,UB,Population,SearchAgents_no,Max_iteration,ishow);
save Pareto.txt Pareto -ascii;  % save data for future use
%% Plot data
plot_data2(M,D,Pareto)