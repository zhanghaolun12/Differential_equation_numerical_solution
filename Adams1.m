%Adams预报-修正法
function y = Adams1(a,b,h,y0)
x = a : h : b;
n = length(x);
y(1) = y0;
%%
%利用P-C求y2,y3,y4
for i = 1 : 3
    y(i+1) = y(i) + h*f1(x(i),y(i));
    y(i+1) = y(i) + (h/2)*(f1(x(i),y(i))+f1(x(i+1),y(i+1)));
end
%%
%Adams预报-修正法求解
for i = 4 : n-1
    y(i+1) = y(i) + (h/24)*(55*f1(x(i),y(i))-59*f1(x(i-1),y(i-1))+37*f1(x(i-2),y(i-2))-9*f1(x(i-3),y(i-3)));
    y(i+1) = y(i) + (h/24)*(9*f1(x(i+1),y(i+1))+19*f1(x(i),y(i))-5*f1(x(i-1),y(i-1))+f1(x(i-2),y(i-2)));
end
end