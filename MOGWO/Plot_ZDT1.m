function z=Plot_ZDT1()

ObjectiveFunction=@(x) ZDT3(x);
x=0:0.01:1;
for i=1:size(x,2)
    TPF(i,:)=ObjectiveFunction([x(i) 0 0 0 0]);
end
line(TPF(:,1),TPF(:,2));
title('ZDT1')

xlabel('f1')
ylabel('f2')
box on

fig=gcf;
set(findall(fig,'-property','FontName'),'FontName','Garamond')
set(findall(fig,'-property','FontAngle'),'FontAngle','italic')
