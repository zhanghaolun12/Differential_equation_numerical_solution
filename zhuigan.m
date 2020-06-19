%%追赶法
%A为系数矩阵
%b为右端项
function [L, U, x] = zhuigan(A, b)
m = size(A, 1);%系数矩阵的阶数
%%
%三角分解
L = zeros(m);
U = zeros(m);
for i = 1 : m-1
    L(i+1,i) = A(i+1,i);
end
L(1,1) = A(1,1);
for i = 2 : m
    U(i-1,i) = A(i-1,i)/L(i-1,i-1);
    L(i,i) = A(i,i) - L(i,i-1)*U(i-1,i);
end
%%
%求解
y(1) = b(1)/L(1,1);
for i = 2 : m
    y(i) = (b(i)-L(i,i-1)*y(i-1))/L(i,i);
end
x(m) = y(m);
for i = m-1 : -1 : 1
    x(i) = y(i) - U(i,i+1)*x(i+1);
end
end