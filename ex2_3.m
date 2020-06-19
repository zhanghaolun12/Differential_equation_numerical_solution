%%古典显格式求抛物型方程
clc;
clear;
xa = 0; xb = 1;%边界范围
ta = 0; tb = 0.5;%时间范围
h = 0.1; k = 0.01/5;%步长
x = xa : h : xb;%位移节点
t = ta : k : tb;%时间节点
[X, T] = meshgrid(x,t);%生成网格节点
m = length(x);%位移节点个数
n = length(t);%时间节点个数
r = k / h^2;
mm = m - 2;
%%
%构造矩阵A
A = zeros(mm);
for i = 1 : mm
    A(i,i) = 1 - 2*r;
end
for i = 1 : mm-1
    A(i, i+1) = r;
    A(i+1, i) = r;
end
%%
%初始条件
for i = 1 : m
    u(1, i) = 1;
end
%%
%边界条件
for i = 2 : n
    u(i,1) = 0;
end
for i = 1 : n-1
    u(i+1,m) = (1-2*r)*u(i,m) + 2*r*u(i,m-1);
end
%%
%求解
for i = 1 : n-1
    u(i+1,2:m-1) = A*u(i,2:m-1)';
end
mesh(X,T,u);