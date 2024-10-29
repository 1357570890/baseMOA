 function MultiObj = GetFunInfo(TestProblem) %46个多目标测试函数
dynamic = 0;  
 switch TestProblem
      %% 静态多目标 46个
        case 1
            nVar = 10;
            numOfObj = 2;
           mop=testmop('zdt1',nVar);
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            name='zdt1';
           load('./ParetoFront/ZDT1.mat');
        MultiObj.truePF = PF;  
        case 2
            nVar = 10;
           mop=testmop('zdt2',nVar);
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 2;
            name='zdt2';
           load('./ParetoFront/ZDT2.mat');
        MultiObj.truePF = PF;  
        case 3
            nVar=10;
           mop=testmop('zdt3',nVar);
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 2;
            name='zdt3';
           load('./ParetoFront/ZDT3.mat');
        MultiObj.truePF = PF;              
      case 4
            nVar=10;
           mop=testmop('zdt4',nVar);
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 2;
            name='zdt4';   
           load('./ParetoFront/ZDT4.mat');
        MultiObj.truePF = PF;              
        case 5
            nVar=10;
            mop=testmop('zdt6',nVar);
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 2;
            name='zdt6';   
           load('./ParetoFront/ZDT6.mat');
        MultiObj.truePF = PF;              
        case 6
            global k M;
            k = 5;
            M = 3;
            nVar = 7;
            mop = testmop('DTLZ1',nVar);
            CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 3;
            dynamic = 0;
             name='DTLZ1';    
         load('./ParetoFront/DTLZ1.mat');
        MultiObj.truePF = PF;  
        case 7
            global k M;
            k = 10;
            M = 3;
            nVar = 12;
            mop = testmop('DTLZ2',nVar);
            CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 3;
            dynamic = 0; 
             name='DTLZ2';  
         load('./ParetoFront/DTLZ2.mat');
        MultiObj.truePF = PF;               
        case 8
            global k M;
            k = 10;
            M = 3;
            nVar = 12;
            mop = testmop('DTLZ3',nVar);
            CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 3;
            dynamic = 0;  
             name='DTLZ3';  
         load('./ParetoFront/DTLZ3.mat');
        MultiObj.truePF = PF;                
        case 9
            global k M;
            k = 10;
            M = 3;
            nVar = 12;
            mop = testmop('DTLZ4',nVar);
            CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 3;
            dynamic = 0;   
             name='DTLZ4';   
         load('./ParetoFront/DTLZ4.mat');
        MultiObj.truePF = PF;                
        case 10
            global k M;
            k = 10;
            M = 3;
            nVar = 12;
            mop = testmop('DTLZ5',nVar);
            CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 3;
            dynamic = 0;
             name='DTLZ5'; 
         load('./ParetoFront/DTLZ5.mat');
        MultiObj.truePF = PF;                
            case 11
            global k M;
            k = 10;
            M = 3;
            nVar = 12;
            mop = testmop('DTLZ6',nVar);
            CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 3;
            dynamic = 0;  
             name='DTLZ6'; 
          load('./ParetoFront/DTLZ6.mat');
        MultiObj.truePF = PF;               
        case 12
            global k M;
            k = 20;
            M = 3;
            nVar = 22;
            mop = testmop('DTLZ7',nVar);
            CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 3;
             name='DTLZ7';  
         load('./ParetoFront/DTLZ7.mat');
        MultiObj.truePF = PF;               
       case 13
            global k l M;
            k = 2;
            l = 4;
            M = 2;
            nVar = 6;
            mop = testmop('wfg1',nVar);
            CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 2;
             name='wfg1';  
         load('./ParetoFront/wfg1.mat');
        MultiObj.truePF = PF;                
        case 14
            global k l M;
            k = 2;
            l = 4;
            M = 2;
            nVar = 6;
            mop = testmop('wfg2',nVar);
            CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 2;
             name='wfg2';  
         load('./ParetoFront/wfg2.mat');
        MultiObj.truePF = PF;                
        case 15
           global k l M;
            k = 2;
            l = 4;
            M = 2;
             nVar = 6;
            mop = testmop('wfg3',nVar);
            CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 2;
             name='wfg3';  
         load('./ParetoFront/wfg3.mat');
        MultiObj.truePF = PF;                
        case 16
           global k l M;
            k = 2;
            l = 4;
            M = 2;
            nVar = 6;
            mop = testmop('wfg4',nVar);
            CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 2;
             name='wfg4'; 
         load('./ParetoFront/wfg4.mat');
        MultiObj.truePF = PF;                
        case 17
           global k l M;
            k = 2;
            l = 4;
            M = 2;
            nVar = 6;
            mop = testmop('wfg5',nVar);
            CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 2;
             name='wfg5';  
          load('./ParetoFront/wfg5.mat');
        MultiObj.truePF = PF;               
        case 18
           global k l M;
            k = 2;
            l = 4;
            M = 2;
            nVar = 6;
            mop = testmop('wfg6',nVar);
            CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 2;
             name='wfg6';  
          load('./ParetoFront/wfg6.mat');
        MultiObj.truePF = PF;               
        case 19
           global k l M;
            k = 2;
            l = 4;
            M = 2;
            nVar = 6;
            mop = testmop('wfg7',nVar);
            CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 2;
             name='wfg7';  
         load('./ParetoFront/wfg7.mat');
        MultiObj.truePF = PF;                
        case 20
           global k l M;
            k = 2;
            l = 4;
            M = 2;
            nVar = 6;
            mop = testmop('wfg8',nVar);
            CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 2;
             name='wfg8';  
         load('./ParetoFront/wfg8.mat');
        MultiObj.truePF = PF;                
        case 21
           global k l M;
            k = 2;
            l = 4;
            M = 2;
            nVar = 6;
            mop = testmop('wfg9',nVar);
            CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 2;
             name='wfg9'; 
         load('./ParetoFront/wfg9.mat');
        MultiObj.truePF = PF;                
        case 22
           global k l M;
            k = 2;
            l = 4;
            M = 2;
             nVar = 6;
            mop = testmop('wfg10',nVar);
            CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            numOfObj = 2;
             name='wfg10';      
        case 23
            nVar = 10;
            numOfObj = 2;
           mop=testmop('uf1',nVar);%uf1
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
             name='uf1';  
         load('./ParetoFront/UF1.mat');
        MultiObj.truePF = PF;                
      case 24
            nVar = 10;
            numOfObj = 2;
           mop=testmop('uf2',nVar);%uf2
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
             name='uf2';    
         load('./ParetoFront/UF2.mat');
        MultiObj.truePF = PF;                
        case 25
            nVar = 10;
            numOfObj = 2;
           mop=testmop('uf3',nVar);%uf3
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
             name='uf3';  
         load('./ParetoFront/UF3.mat');
        MultiObj.truePF = PF;                
        case 26
            nVar = 10;
            numOfObj = 2;
           mop=testmop('uf4',nVar);%uf4
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
             name='uf4';  
         load('./ParetoFront/UF4.mat');
        MultiObj.truePF = PF;                
        case 27
            nVar = 10;
            numOfObj = 2;
           mop=testmop('uf5',nVar);%uf
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';  
              name='uf5';   
         load('./ParetoFront/UF5.mat');
        MultiObj.truePF = PF;                 
        case 28
            nVar = 10;
            numOfObj = 2;
           mop=testmop('uf6',nVar);%uf6
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            name='uf6';
         load('./ParetoFront/UF6.mat');
        MultiObj.truePF = PF;               
        case 29
            nVar = 10;
            numOfObj = 2;
           mop=testmop('uf7',nVar);%uf7
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            name='uf7';
         load('./ParetoFront/UF7.mat');
        MultiObj.truePF = PF;               
        case 30
            nVar = 10;
            numOfObj = 3;
           mop=testmop('uf8',nVar);%uf8
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            name='uf8';
         load('./ParetoFront/UF8.mat');
        MultiObj.truePF = PF;               
        case 31
            nVar = 10;
            numOfObj = 3;
           mop=testmop('uf9',nVar);%uf9
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            name='uf9';
         load('./ParetoFront/UF9.mat');
        MultiObj.truePF = PF;               
        case 32
            nVar = 10;
            numOfObj = 3;
           mop=testmop('uf10',nVar);%uf10
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)'; 
            name='uf10';
          load('./ParetoFront/UF10.mat');
        MultiObj.truePF = PF;              
        case 33
            nVar = 10;
            numOfObj = 2;
           mop=testmop('cf1',nVar);%cf1
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            name='cf1';
         load('./ParetoFront/CF1.mat');
        MultiObj.truePF = PF;               
        case 34
            nVar = 10;
            numOfObj = 2;
           mop=testmop('cf2',nVar);%cf2
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            name='cf2';
         load('./ParetoFront/CF2.mat');
        MultiObj.truePF = PF;                
        case 35
            nVar = 10;
            numOfObj = 2;
           mop=testmop('cf3',nVar);%cf3
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            name='cf3';
         load('./ParetoFront/CF3.mat');
        MultiObj.truePF = PF;                
        case 36
            nVar = 10;
            numOfObj = 2;
           mop=testmop('cf4',nVar);%cf4
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            name='cf4';
         load('./ParetoFront/CF4.mat');
        MultiObj.truePF = PF;                
        case 37
            nVar = 10;
            numOfObj = 2;
           mop=testmop('cf5',nVar);%cf
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            name='cf5';
         load('./ParetoFront/CF5.mat');
        MultiObj.truePF = PF;                
        case 38
            nVar = 10;
            numOfObj = 2;
           mop=testmop('cf6',nVar);%cf6
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            name='cf6';
         load('./ParetoFront/CF6.mat');
        MultiObj.truePF = PF;                
        case 39
            nVar = 10;
            numOfObj = 2;
           mop=testmop('cf7',nVar);%cf7
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            name='cf7';
          load('./ParetoFront/CF7.mat');
        MultiObj.truePF = PF;               
        case 40
            nVar = 10;
            numOfObj = 3;
           mop=testmop('cf8',nVar);%cf8
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            name='cf8';
         load('./ParetoFront/CF8.mat');
        MultiObj.truePF = PF;                
        case 41
            nVar = 10;
            numOfObj = 3;
           mop=testmop('cf9',nVar);%cf9
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)';
            name='cf9';
          load('./ParetoFront/CF9.mat');
        MultiObj.truePF = PF;               
        case 42
            nVar = 10;
            numOfObj = 3;
           mop=testmop('cf10',nVar);%cf10
           CostFunction=@(x) mop.func(x);
            VarMin = mop.domain(:,1)';
            VarMax = mop.domain(:,2)'; 
            name='cf10';
          load('./ParetoFront/CF10.mat');
        MultiObj.truePF = PF;               
    case 43          % Kursawe 
       CostFunction = @(x) [-10.*(exp(-0.2.*sqrt(x(:,1).^2+x(:,2).^2)) + exp(-0.2.*sqrt(x(:,2).^2+x(:,3).^2))); ...
                             sum(abs(x).^0.8 + 5.*sin(x.^3),2)];
        nVar = 3;
        VarMin = -5.*ones(1,nVar);
        VarMax = 5.*ones(1,nVar);
        load('./ParetoFront/Kursawe.mat');
        MultiObj.truePF = PF;
        name='Kursawe';
          numOfObj = 2;
    case 44           % Poloni's two-objective
        A1 = 0.5*sin(1)-2*cos(1)+sin(2)-1.5*cos(2);
        A2 = 1.5*sin(1)-cos(1)+2*sin(2)-0.5*cos(2);
        B1 = @(x,y) 0.5.*sin(x)-2.*cos(x)+sin(y)-1.5.*cos(y);
        B2 = @(x,y) 1.5.*sin(x)-cos(x)+2.*sin(y)-0.5.*cos(y);
        f1 = @(x,y) 1+(A1-B1(x,y)).^2+(A2-B2(x,y)).^2;
        f2 = @(x,y) (x+3).^2+(y+1).^2;
       CostFunction = @(x) [f1(x(:,1),x(:,2)); f2(x(:,1),x(:,2))];
        nVar = 2;
       VarMin = -pi.*ones(1,nVar);
        VarMax = pi.*ones(1,nVar);
        name='Poloni';
          numOfObj = 2;
    case 45         % Viennet2
        f1 = @(x,y) 0.5.*(x-2).^2+(1/13).*(y+1).^2+3;
        f2 = @(x,y) (1/36).*(x+y-3).^2+(1/8).*(-x+y+2).^2-17;
        f3 = @(x,y) (1/175).*(x+2.*y-1).^2+(1/17).*(2.*y-x).^2-13;
        CostFunction = @(x) [f1(x(:,1),x(:,2)); f2(x(:,1),x(:,2)); f3(x(:,1),x(:,2))];
        nVar = 2;
        VarMin = [-4, -4];
        VarMax = [4, 4];
        load('./ParetoFront/Viennet2.mat');
        MultiObj.truePF = PF;
        name='Viennet2';
          numOfObj = 3;
    case 46         % Viennet3
        f1 = @(x,y) 0.5.*(x.^2+y.^2)+sin(x.^2+y.^2);
        f2 = @(x,y) (1/8).*(3.*x-2.*y+4).^2 + (1/27).*(x-y+1).^2 +15;
        f3 = @(x,y) (1./(x.^2+y.^2+1))-1.1.*exp(-(x.^2+y.^2));
        CostFunction = @(x) [f1(x(:,1),x(:,2)); f2(x(:,1),x(:,2)); f3(x(:,1),x(:,2))];
        nVar = 2;
        VarMin = [-3, -10];
        VarMax = [10, 3];
        load('./ParetoFront/Viennet3.mat');
        MultiObj.truePF = PF;   
        name='Viennet3';
          numOfObj = 3;
     case 47
         f1=@(r,R,F,s) 4.9.*10.^(-5).*(R.^2-r.^2).*(s-1);
         f2=@(r,R,F,s) 9.82.*10.^(6).*(R.^2-r.^2)./(F.*s.*(R.^3-r.^3));
         g1=@(r,R,F,s) 20-(R-r);
         g2=@(r,R,F,s) 2.5.*(s+1)-30;
         g3=@(r,R,F,s) F./(3.14.*(R.^2-r.^2))-0.4;
         g4=@(r,R,F,s) 2.22.*10.^(-3).*F.*(R.^3-r.^3)./(R.^2-r.^2).^2-1;
         g5=@(r,R,F,s) 900-0.0266.*F.*s.*(R.^3-r.^3)./(R.^2-r.^2);
         g=@(r,R,F,s) 10.^3.*(max(0,g1(r,R,F,s))+max(0,g2(r,R,F,s))+max(0,g3(r,R,F,s))+max(0,g4(r,R,F,s))+max(0,g5(r,R,F,s)));
         CostFunction = @(x) [f1(x(:,1),x(:,2),x(:,3),x(:,4))+g(x(:,1),x(:,2),x(:,3),x(:,4)); f2(x(:,1),x(:,2),x(:,3),x(:,4))+g(x(:,1),x(:,2),x(:,3),x(:,4))];
         nVar = 4;
        VarMin = [55, 75,1000,2];
        VarMax = [80, 110,3000,20];
         name='盘式制动器设计';
         numOfObj = 2;
 end
   MultiObj.nVar=nVar;
   MultiObj.var_min = VarMin;
   MultiObj.var_max =VarMax;
   MultiObj.fun=CostFunction;
   MultiObj.dynamic=dynamic;
   MultiObj.numOfObj=numOfObj;
   MultiObj.name=name;
end