%% C-N��ʽ�������ͷ���
function [A,B,u] = CN(xa,xb,ta,tb,h,k)
r = k / h^2;
x = xa : h : xb;
t = ta : k : tb;
n = length(t);%ʱ��ڵ�t�ĸ���
m = length(x);%λ�ƽڵ�x�ĸ���
mm = m - 2;
%%
%�������A��B
A = zeros(mm);
for i = 1 : mm
    A(i, i) = 1 - r;
end
for i = 1 : mm-1
    A(i, i+1) = r/2;
    A(i+1, i) = r/2;
end
B = zeros(mm);
for i = 1 : mm
    B(i, i) = 1 + r;
end
for i = 1 : mm-1
    B(i, i+1) = -r/2;
    B(i+1, i) = -r/2;
end
%%
%��ʼ����
for i = 1 : m
    u(1,i) = fai(x(i));
end
%%
%�߽�����
for i = 2 : n
    u(i,1) = 0;
    u(i,m) = 0;
end
%%
%���
for i = 1 : n-1
    b = A * u(i, 2:m-1)';
    [~,~,uu] = zhuigan(B, b);
    u(i+1,2:m-1) = uu;
end
end