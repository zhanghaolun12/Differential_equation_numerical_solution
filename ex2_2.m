%%C-N差分格式求抛物型方程
clc;
clear;
xa = 0; xb = 1; 
ta = 0; tb = 0.5; 
h = 0.1; k = 0.1; %步长
x = xa : h : xb;%位移节点
t = ta : k : tb;%时间节点
[X, T] = meshgrid(x,t);%生成网格节点
%%
%解析解
u = exp(-pi^2.*T).*sin(pi.*X);
mesh(X,T,u);
xlabel('x');ylabel('t');zlabel('u');
title('偏微分方程解析解');
%%
%C-N数值解
[A, B, U] = CN(xa,xb,ta,tb,h,k);
figure
mesh(X,T,U);
xlabel('x');ylabel('t');zlabel('u');
title('偏微分方程数值解');
%%
%误差
e = u - U;
figure
mesh(X,T,e);
xlabel('x');ylabel('t');zlabel('误差e');
title('误差分布图');
%%
figure
plot(x,u(t==0.2,:),x,U(t==0.2,:),'*');
xlabel('x');ylabel('u');
legend('解析解','数值解');
title('t=0.2处的解');
figure
plot(x,u(t==0.5,:),x,U(t==0.5,:),'*');
xlabel('x');ylabel('u');
legend('解析解','数值解');
title('t=0.5处的解');