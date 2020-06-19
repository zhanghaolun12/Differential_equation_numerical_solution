clc;
clear;
xa = 0; xb = 4;
ya = 0; yb = 3;
h = 0.1; %步长
x = xa : h : xb;
y = ya : h : yb;
[X, Y] = meshgrid(x,y);
%% 内部节点初始值
u0 = zeros(length(y)-2,length(x)-2);

%% Jacobi迭代法求解
[U1,iter1] = Jacobi(xa,xb,ya,yb,h,u0);
mesh(X,Y,U1);
xlabel('x'); ylabel('y'); zlabel('u');
title('Jacobi迭代求解结果');

%% G-S迭代法求解
[U2,iter2] = GS(xa,xb,ya,yb,h,u0);
figure
mesh(X,Y,U2);
xlabel('x'); ylabel('y'); zlabel('u');
title('G-S迭代求解结果');