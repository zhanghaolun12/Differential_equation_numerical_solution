function [y1,y2,y3,y4] = equation2(a,b,h,y0)
x = a : h : b;
m = length(x);
y1(1) = y0;%初值
y2(1) = y0;
y3(1) = y0;
y4(1) = y0;

%%
%euler法
for i = 1 : m-1
    y1(i+1) = y1(i) + h*f2(x(i), y1(i));
end

%%
%中点格式
for i = 1 : m - 1
    y2(i+1) = y2(i) + h*f2(x(i)+h/2, y2(i)+(h/2)*f2(x(i),y2(i)));
end

%%
%预报-校正格式
for i = 1 : m-1
    y3(i+1) = y3(i) + h*f2(x(i), y3(i));
    y3(i+1) = y3(i) + (h/2)*(f2(x(i),y3(i))+f2(x(i+1),y3(i+1)));
end

%%
%经典四级四阶R-K格式
for i = 1 : m-1
    k1 = f2(x(i),y4(i));
    k2 = f2(x(i)+h/2,y4(i)+h*k1/2);
    k3 = f2(x(i)+h/2,y4(i)+h*k2/2);
    k4 = f2(x(i)+h,y4(i)+h*k3);
    y4(i+1) = y4(i) + (h/6)*(k1+2*k2+2*k3+k4);
end
end