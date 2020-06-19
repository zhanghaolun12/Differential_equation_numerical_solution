clc;
clear;
xa = 0; xb = 4;
ya = 0; yb = 3;
h = 0.1; %����
x = xa : h : xb;
y = ya : h : yb;
[X, Y] = meshgrid(x,y);
%% �ڲ��ڵ��ʼֵ
u0 = zeros(length(y)-2,length(x)-2);

%% Jacobi���������
[U1,iter1] = Jacobi(xa,xb,ya,yb,h,u0);
mesh(X,Y,U1);
xlabel('x'); ylabel('y'); zlabel('u');
title('Jacobi���������');

%% G-S���������
[U2,iter2] = GS(xa,xb,ya,yb,h,u0);
figure
mesh(X,Y,U2);
xlabel('x'); ylabel('y'); zlabel('u');
title('G-S���������');