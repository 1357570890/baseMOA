function [Best_universe_Inflation_rate,Best_universe,Archive_F]=MOMVO(Max_time,N,ArchiveMaxSize)
fobj=@Obj_function;
% Welded beam design optimization
dim=4;
lb=[0.125 0.1  0.1 0.125];
ub=[5.0 10.0 10.0 5.0];
obj_no=2;
if size(ub,2)==1
    ub=ones(1,dim)*ub;
    lb=ones(1,dim)*lb;
end
Best_universe=zeros(1,dim);
Best_universe_Inflation_rate=inf*ones(1,obj_no); %change this to -inf for maximization problems
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Archive_X=zeros(ArchiveMaxSize,dim);
Archive_F=ones(ArchiveMaxSize,obj_no)*inf;
Archive_member_no=0;
%Minimum and maximum of Wormhole Existence Probability (min and max in
% Eq.(3.3) in the paper
WEP_Max=1;
WEP_Min=0.2;
%Initialize the positions of universes
Universes=initialization(N,dim,ub,lb);
%Iteration(time) counter
Time=1;

%Main loop
while Time<Max_time+1

    %Eq. (3.3) in the original MVO paper
    WEP=WEP_Min+Time*((WEP_Max-WEP_Min)/Max_time);

    %Travelling Distance Rate (Formula): Eq. (3.4) in the original MVO paper
    TDR=1-((Time)^(1/6)/(Max_time)^(1/6));

    %Inflation rates (I) (fitness values)
    %Inflation_rates=zeros(1,size(Universes,1));

    for i=1:size(Universes,1)

        %Boundary checking (to bring back the universes inside search
        % space if they go beyoud the boundaries
        Flag4ub=Universes(i,:)>ub;
        Flag4lb=Universes(i,:)<lb;
        Universes(i,:)=(Universes(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;

        %Calculate the inflation rate (fitness) of universes
        Inflation_rates(i,:)=fobj(Universes(i,:));

        %Elitism
        if dominates(Inflation_rates(i,:),Best_universe_Inflation_rate)
            Best_universe_Inflation_rate=Inflation_rates(i,:);
            Best_universe=Universes(i,:);
        end

    end

    [sorted_Inflation_rates,sorted_indexes]=sort(Inflation_rates);

    for newindex=1:N
        Sorted_universes(newindex,:)=Universes(sorted_indexes(newindex),:);
    end

    %Normaized inflation rates (NI in Eq. (3.1) in the original MVO paper)
    normalized_sorted_Inflation_rates=normr(sorted_Inflation_rates);

    Universes(1,:)= Sorted_universes(1,:);

    [Archive_X, Archive_F, Archive_member_no]=UpdateArchive(Archive_X, Archive_F, Universes, Inflation_rates, Archive_member_no);
    if Archive_member_no>ArchiveMaxSize
        Archive_mem_ranks=RankingProcess(Archive_F, ArchiveMaxSize, obj_no);
        [Archive_X, Archive_F, Archive_mem_ranks, Archive_member_no]=HandleFullArchive(Archive_X, Archive_F, Archive_member_no, Archive_mem_ranks, ArchiveMaxSize);
    else
        Archive_mem_ranks=RankingProcess(Archive_F, ArchiveMaxSize, obj_no);
    end
    Archive_mem_ranks=RankingProcess(Archive_F, ArchiveMaxSize, obj_no);
    % to improve coverage
    index=RouletteWheelSelection(1./Archive_mem_ranks);
    if index==-1
        index=1;
    end
    Best_universe_Inflation_rate=Archive_F(index,:);
    Best_universe=Archive_X(index,:);



    %Update the Position of universes
    for i=2:size(Universes,1)%Starting from 2 since the firt one is the elite
        Back_hole_index=i;
        for j=1:size(Universes,2)
            r1=rand();
            if r1<normalized_sorted_Inflation_rates(i)
                White_hole_index=RouletteWheelSelection(-sorted_Inflation_rates);% for maximization problem -sorted_Inflation_rates should be written as sorted_Inflation_rates
                if White_hole_index==-1
                    White_hole_index=1;
                end
                %Eq. (3.1) in the paper
                Universes(Back_hole_index,j)=Sorted_universes(White_hole_index,j);
            end

            if (size(lb',1)==1)
                %Eq. (3.2) in the original MVO paper if the boundaries are all the same
                r2=rand();
                if r2<WEP
                    r3=rand();
                    if r3<0.5
                        Universes(i,j)=Best_universe(1,j)+TDR*((ub-lb)*rand+lb);
                    end
                    if r3>0.5
                        Universes(i,j)=Best_universe(1,j)-TDR*((ub-lb)*rand+lb);
                    end
                end
            end

            if (size(lb',1)~=1)
                %Eq. (3.2) in the original MVO paper if the upper and lower bounds are
                %different for each variables
                r2=rand();
                if r2<WEP
                    r3=rand();
                    if r3<0.5
                        Universes(i,j)=Best_universe(1,j)+TDR*((ub(j)-lb(j))*rand+lb(j));
                    end
                    if r3>0.5
                        Universes(i,j)=Best_universe(1,j)-TDR*((ub(j)-lb(j))*rand+lb(j));
                    end
                end
            end

        end
    end
    disp(['At the iteration ', num2str(Time), ' there are ', num2str(Archive_member_no), ' non-dominated solutions in the archive']);
    Time=Time+1;
end



