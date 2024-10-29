%微信公众号搜索：淘个代码，获取更多免费代码
%禁止倒卖转售，违者必究！！！！！
%唯一官方店铺：https://mbd.pub/o/author-amqYmHBs/work
%代码清单：https://docs.qq.com/sheet/DU3NjYkF5TWdFUnpu
%%

%% Main code

%
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%
%% Call Function
number = "F10";
[output] = MRSO(30, number);

average = mean(output);

std_dev = std(output);

disp(['Average of Best Cost = ' num2str(average)]);

disp(['Standard Deviation of Best Cost = ' num2str(std_dev)]);

%微信公众号搜索：淘个代码，获取更多免费代码
%禁止倒卖转售，违者必究！！！！！
%唯一官方店铺：https://mbd.pub/o/author-amqYmHBs/work
%代码清单：https://docs.qq.com/sheet/DU3NjYkF5TWdFUnpu
