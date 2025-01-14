%微信公众号搜索：淘个代码，获取更多免费代码
%禁止倒卖转售，违者必究！！！！！
%唯一官方店铺：https://mbd.pub/o/author-amqYmHBs/work
%代码清单：https://docs.qq.com/sheet/DU3NjYkF5TWdFUnpu
%%

function [best_M,Convergence_curve]=MGO(SearchAgents_no,MaxFEs,lb,ub,dim,fobj)
%% Initialization
FEs=0;
best_cost=inf; %change this to -inf for maximization problems
best_M = zeros(1,dim);
M=initialization(SearchAgents_no,dim,ub,lb); %Initialize the set of random solutions
costs = zeros(1,SearchAgents_no);
for i=1:SearchAgents_no
    costs(i)=fobj(M(i,:)) ;
    FEs=FEs+1;
    if costs(i)<best_cost 
        best_M=M(i,:); 
        best_cost = costs(1,i);
    end
end

Convergence_curve=[];
it=1;
rec = 1;

w = 2;
rec_num = 10;
divide_num = dim/4;
% divide_num = min(SearchAgents_no/4, dim/4);
d1 = 0.2;

newM = zeros(SearchAgents_no, dim);
newM_cost = zeros(1, SearchAgents_no);
rM = zeros(SearchAgents_no,dim,rec_num); %record history positions
rM_cos = zeros(1,SearchAgents_no,rec_num);
%% Main Loop
while FEs<MaxFEs
    calPositions = M;
    div_num = randperm(dim);
        %Divide the population and select the regions with more individuals based on the best
        for j=1:max(divide_num,1)
            th = best_M(div_num(j));
            index = calPositions(:,div_num(j)) > th;
            if sum(index) < size(calPositions, 1)/2 %choose the side of the majority
                index = ~index;
            end
            calPositions = calPositions(index,:);
        end
    D = best_M - calPositions; %Compute the distance from individuals to the best
    D_wind = sum(D, 1)/size(calPositions, 1); %Calculate the mean of all distances
 
    beta = size(calPositions, 1) / SearchAgents_no;
    gama = 1/sqrt(1-power(beta,2));
    step = w * (rand(size(D_wind))-0.5) * (1-FEs/MaxFEs);
    step2 = 0.1*w*(rand(size(D_wind))-0.5)* (1-FEs/MaxFEs)*(1+1/2*(1+tanh(beta/gama))*(1-FEs/MaxFEs));
    step3 = 0.1*(rand()-0.5) * (1-FEs/MaxFEs);
    act =actCal(1 ./ 1 + (0.5 - 10*(rand(size(D_wind)))));
    
    if rec == 1 %record the first generation of positions
        rM(:,:,rec) = M;
        rM_cos(1,:,rec) = costs;
        rec = rec + 1;
    end
  
    for i=1:SearchAgents_no    
        newM(i,:) = M(i,:);
        %Spore dispersal search
        %Update M using Eq.(6)
         if rand()>d1
            newM(i,:) = newM(i,:) + step .* D_wind; 
         else
            newM(i,:) = newM(i,:) + step2 .* D_wind;
        end

        if rand() < 0.8
            % Dual propagation search
            %Update M using Eq.(11)
            if rand() > 0.5
                newM(i,div_num(1)) = best_M(div_num(1)) + step3 * D_wind(div_num(1));
            else
                newM(i,:) = (1-act) .* newM(i,:)+act .* best_M;
            end
        end
              
        %Boundary absorption
        Flag4ub=newM(i,:)>ub;
        Flag4lb=newM(i,:)<lb;
        newM(i,:)=(newM(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
 
        newM_cost(i)=fobj(newM(i,:));
        FEs=FEs+1;
        
        % Cryptobiosis mechanism
        rM(i,:,rec) = newM(i,:);
        rM_cos(1,i,rec) = newM_cost(i);
        
        
        if newM_cost(i)<best_cost 
           best_M=newM(i,:);
           best_cost=newM_cost(i);
        end    
    end %End for
    
    rec = rec + 1;
    % Cryptobiosis mechanism
    if rec > rec_num || FEs>=MaxFEs
        [lcost,Iindex] = min(rM_cos, [] ,3);
        for i=1:SearchAgents_no
            M(i,:) = rM(i,:,Iindex(i));
        end
        costs = lcost;
        rec = 1;
    end
    
    Convergence_curve(it)=best_cost;
    it=it+1;
end
end

function [act] = actCal(X)
    act = X;
    act(act>=0.5) = 1;
    act(act<0.5) = 0;
end


%微信公众号搜索：淘个代码，获取更多免费代码
%禁止倒卖转售，违者必究！！！！！
%唯一官方店铺：https://mbd.pub/o/author-amqYmHBs/work
%代码清单：https://docs.qq.com/sheet/DU3NjYkF5TWdFUnpu
