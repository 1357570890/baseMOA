clc;
clear;
close all;
format long g
% Initial parameters of the MODA algorithm
max_iter=100;
N=100;
ArchiveMaxSize=100;
obj_no=2;
Archive_F1=load('weldedbeam.txt');
[Best_universe_score,Best_universe_pos,Archive_F]=MOMVO(max_iter,N,ArchiveMaxSize);
plot(Archive_F1(:,1),Archive_F1(:,2),'Color','b','LineWidth',4);
hold on
plot(Archive_F(:,1),Archive_F(:,2),'ro','LineWidth',2,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'MarkerSize',6);
legend('True PF','Obtained PF');
title('MOMVO FOR Welded beam design PROBLEM');
xlabel('obj_1');
ylabel('obj_2');
