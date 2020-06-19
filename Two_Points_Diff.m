function [A,L,U,u] = Two_Points_Diff(a,b,h,u0,um)
x = a : h : b;
m = length(x);
u(1) = u0;
u(m) = um;
%%
%构造系数矩阵
A = zeros(m-2);
for i = 1 : m-2
    A(i, i) = 2+h^2 * q(x(i+1));
end
for i = 1 : m-3
    A(i, i+1) = -1;
    A(i+1, i) = -1;
end
%%
%构造右端项
b(1) = h^2 * tpf(x(2)) + u0;
b(m-2) = h^2 * tpf(x(m-1)) + um;
for i = 2 : m-3
    b(i) = h^2 * tpf(x(i+1));
end
%%
%三角分解
L = zeros(m-2);
U = zeros(m-2);
for i = 1 : m-3
    L(i+1,i) = A(i+1,i);
end
L(1,1) = A(1,1);
for i = 2 : m-2
    U(i-1,i) = A(i-1,i)/L(i-1,i-1);
    L(i,i) = A(i,i) - L(i,i-1)*U(i-1,i);
end
%%
%求解
y(1) = b(1)/L(1,1);
for i = 2 : m-2
    y(i) = (b(i)-L(i,i-1)*y(i-1))/L(i,i);
end
u(m-1) = y(m-2);
for i = m-2 : -1 : 2
    u(i) = y(i-1) - U(i-1,i)*u(i+1);
end
end
