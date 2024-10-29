function d = distance(a,b)
% d = sqrt(abs(repmat(aa',[1 size(bb,2)]) + repmat(bb,[size(aa,2) 1]) - 2*ab));
d=sqrt((a(1)-b(1))^2+(a(2)-b(2))^2);