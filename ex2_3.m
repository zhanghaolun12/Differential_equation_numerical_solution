%%�ŵ��Ը�ʽ�������ͷ���
clc;
clear;
xa = 0; xb = 1;%�߽緶Χ
ta = 0; tb = 0.5;%ʱ�䷶Χ
h = 0.1; k = 0.01/5;%����
x = xa : h : xb;%λ�ƽڵ�
t = ta : k : tb;%ʱ��ڵ�
[X, T] = meshgrid(x,t);%��������ڵ�
m = length(x);%λ�ƽڵ����
n = length(t);%ʱ��ڵ����
r = k / h^2;
mm = m - 2;
%%
%�������A
A = zeros(mm);
for i = 1 : mm
    A(i,i) = 1 - 2*r;
end
for i = 1 : mm-1
    A(i, i+1) = r;
    A(i+1, i) = r;
end
%%
%��ʼ����
for i = 1 : m
    u(1, i) = 1;
end
%%
%�߽�����
for i = 2 : n
    u(i,1) = 0;
end
for i = 1 : n-1
    u(i+1,m) = (1-2*r)*u(i,m) + 2*r*u(i,m-1);
end
%%
%���
for i = 1 : n-1
    u(i+1,2:m-1) = A*u(i,2:m-1)';
end
mesh(X,T,u);