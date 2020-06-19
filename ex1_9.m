clc;
clear;
%%
%高阶微分方程的初始条件
a = 0; b = 3; h = 0.2;
x = a : h : b;
y1 = 0; y2 = 1;
Y0 = [y1; y2];
%%
%四级四阶RK法
Y1 = High_RK(a,b,h,Y0);
%%
%Adams预报-修正法
Y2 = High_Adams(a,b,h,Y0);
%%
%解析解
y1 = sin(x);
y2 = cos(x);
%%
%误差
e11 = abs(y1-Y1(1,:));
e12 = abs(y1-Y2(1,:));
e21 = abs(y2-Y1(2,:));
e22 = abs(y2-Y2(2,:));
%%
%画图
plot(x,Y1(1,:),'*',x,y1);
xlabel('x'); ylabel('y1');
legend('四级四阶RK法','解析解');
figure
plot(x,Y1(2,:),'*',x,y2);
xlabel('x'); ylabel('y2');
legend('四级四阶RK法','解析解');
figure
plot(x,Y2(1,:),'*',x,y1);
xlabel('x'); ylabel('y1');
legend('Adams预报-修正法','解析解');
figure
plot(x,Y2(2,:),'*',x,y2);
xlabel('x'); ylabel('y2');
legend('Adams预报-修正法','解析解');
