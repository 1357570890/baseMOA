t = linspace(0,1);
F = simple_mult(t');
plot(t,F','LineWidth',2)
hold on
plot([0,0],[0,8],'g--');
plot([1,1],[0,8],'g--');
plot([0,1],[1,6],'k.','MarkerSize',15);
text(-0.25,1.5,'Minimum(f_1(x))')
text(.75,5.5,'Minimum(f_2(x))')
hold off
legend('f_1(x)','f_2(x)')
xlabel({'x';'Tradeoff region between the green lines'})

k = 1;
[min1,minfn1] = fminbnd(@(x)pickindex(x,k),-1,2);
k = 2;
[min2,minfn2] = fminbnd(@(x)pickindex(x,k),-1,2);

goal = [minfn1,minfn2];

nf = 2; % Number of objective functions
N = 500; % Number of points for plotting
onen = 1/N;
x = zeros(N+1,1);
f = zeros(N+1,nf);
fun = @simple_mult;
x0 = 0.5;
options = optimoptions('fgoalattain','Display','off');
for r = 0:N
t = onen*r; % 0 through 1
weight = [t,1-t];
[x(r+1,:),f(r+1,:)] = fgoalattain(fun,x0,goal,weight,...
[],[],[],[],[],[],[],options);
end
figure
plot(f(:,1),f(:,2),'ko');
figure
x1 = f(:,1);
y1 = f(:,2);
x2=linspace(min(x1),max(x1));
y2=interp1(x1,y1,x2,'spline');
xlabel('f_1')
ylabel('f_2')
plot(x2,y2)

function f = simple_mult(x)
% f(:,1) = sqrt(1+x.^2);
% f(:,2) = 4 + 2*sqrt(1+(x-1).^2);

n=numel(x);
f1=x(1);
g=1+9/(n-1)*sum(x(2:end));
h=1-sqrt(f1/g);
f2=g*h;
f=[f1
    f2];

end

function z = pickindex(x,k)
z = simple_mult(x); % evaluate both objectives
z = z(k); % return objective k
end