clc;
clear;
%微分方程1的初始条件
a = 1; b = 2;
h = 0.1;
x = a : h : b;
y0 = 1;
Y = sqrt(x.^3/2 + x./2);%解析解
y = Adams1(a,b,h,y0);
plot(x,Y);
hold on
plot(x,y,'*');
xlabel('x');ylabel('y');
legend('解析解','Adams预估-修正法');