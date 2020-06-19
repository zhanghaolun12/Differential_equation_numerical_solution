%Adams预估校正格式
function Y = High_Adams(a,b,h,Y0)
n = length(Y0);
x = a : h : b;
m = length(x);
%%
%初值
for i = 1 : n
    Y(i,1) = Y0(i);
end
%%
%P-C法求y2,y3,y4
for i = 1 : 3
    Y(:,i+1) = Y(:,i) + h.*F(x(i),Y(:,i));
    Y(:,i+1) = Y(:,i) + (h/2).*(F(x(i),Y(:,i))+F(x(i+1),Y(:,i+1)));
end
for i = 4 : m-1
    Y(:, i+1) = Y(:,i)+(h/24).*(55.*F(x(i),Y(:,i))-59.*F(x(i-1),Y(:,i-1))+37*F(x(i-2),Y(:,i-2))-9*F(x(i-3),Y(:,i-3)));
    Y(:, i+1) = Y(:,i)+(h/24).*(9.*F(x(i+1),Y(:,i+1))+19.*F(x(i),Y(:,i))-5.*F(x(i-1),Y(:,i-1))+F(x(i-2),Y(:,i-2)));
end
end
    