%微信公众号搜索：淘个代码，获取更多免费代码
%禁止倒卖转售，违者必究！！！！！
%唯一官方店铺：https://mbd.pub/o/author-amqYmHBs/work
%代码清单：https://docs.qq.com/sheet/DU3NjYkF5TWdFUnpu
%%
%   Cite this article
%%  Modified Rat Swarm Optimization (MRSO) Algorithm 
%%  Paper title: MRSO: Balancing Exploration and Exploitation through Modified Rat Swarm Optimization for Global Optimiza-tion  
%%  Authors: Azad A. Ameen; Hemin Sardar Abdulla; Sarwar Ibrahim Saeed; Ismail Asaad Mohammed and Tarik A. Rashid
%%  Journals: Algorithms (17/9/2024)
%%  DOI: 

%% Developed in MATLAB R2020a                                  
%                                                                        
%  Designed and Developed: Dr.Azad A. Ameen                              
%                                                                         
%         E-Mail: mscazad@gmail.com 
%                 azad.ameen@chu.edu.iq
%                 azad.ameencs@gmail.com

function Pos=init(nPop,dim,ub,lb)

Boundary= size(ub,2); 
if Boundary==1
    Pos=rand(nPop,dim).*(ub-lb)+lb;
end

if Boundary>1
    for i=1:dim
        ub_i=ub(i);
        lb_i=lb(i);
        Pos(:,i)=rand(nPop,1).*(ub_i-lb_i)+lb_i;
    end
end
%微信公众号搜索：淘个代码，获取更多免费代码
%禁止倒卖转售，违者必究！！！！！
%唯一官方店铺：https://mbd.pub/o/author-amqYmHBs/work
%代码清单：https://docs.qq.com/sheet/DU3NjYkF5TWdFUnpu
