%微信公众号搜索：淘个代码，获取更多免费代码
%禁止倒卖转售，违者必究！！！！！
%唯一官方店铺：https://mbd.pub/o/author-amqYmHBs/work
%代码清单：https://docs.qq.com/sheet/DU3NjYkF5TWdFUnpu
%%

%% Main code


%
function [output] = MRSO(itt,F)

        for n=1:itt

            
            Function_name=F;                         % Name of the test function from beanchmark test functions
            [lb,ub,dim,fobj]=CEC2019(Function_name);
            ShowIterInfo = true;                     % Flag for Showing Iteration Information                              

            MaxIt = 500;                             % max Iteration numbers
            nPop = 30;                               % Population size
            
            Position=zeros(1,dim);
            Score=inf; 
            Positions=init(nPop,dim,ub,lb);          %initialization
            Convergence=zeros(1,MaxIt);
			
			
            l=0;                                      %% Parameters of MRSO
            x = 1;
            y = 5;
            R = floor((y-x).*rand(1,1) + x);            % equation No. (3)
            
            for it=1:MaxIt
%                         

                    for i=1:size(Positions,1)  

                    Flag4Upper_bound=Positions(i,:)>ub;
                    Flag4Lower_bound=Positions(i,:)<lb;
                    Positions(i,:)=(Positions(i,:).*(~(Flag4Upper_bound+Flag4Lower_bound)))+ub.*Flag4Upper_bound+lb.*Flag4Lower_bound;               

                    fitness=fobj(Positions(i,:));

                    if fitness<Score 
                        Score=fitness; 
                        Position=Positions(i,:);
                    end

                    end

                     F1=R-l*((R)/MaxIt);               % equation No. (6)
                     F2=(1-it*((1)/MaxIt));            % equation No. (7)
                     F3=(2*rand-1*rand);               % equation No. (8)					 
                     Ar=F1*F2*F3;                      % equation No. (9)              
                for i=1:nPop
                    for j=1:dim     
                        C=2*rand();                     % equation No. (4)           
                        Positions(i,j)=Position(j)-(Ar*Positions(i,j)+abs(C*((Position(j)-Positions(i,j))))); % equation No. (1)

                    end
                end
                l=l+1;    
                Convergence(it)=Score;

                % Display Iteration Information
                if ShowIterInfo
                    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(Convergence(it))]);
                end
            end
            out.pop = Positions;
            out.BestSol = Score;
            out.BestCosts = Convergence;
            semilogy(Convergence, 'LineWidth', 2);
            xlabel('Iteration');
            ylabel([F,'Best Cost']);
            grid on;
            output = zeros(itt, 1);
            output1 (n) = Score; % added!
            output = output1;
        end
end
%微信公众号搜索：淘个代码，获取更多免费代码
%禁止倒卖转售，违者必究！！！！！
%唯一官方店铺：https://mbd.pub/o/author-amqYmHBs/work
%代码清单：https://docs.qq.com/sheet/DU3NjYkF5TWdFUnpu
