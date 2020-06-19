%%׷�Ϸ�
%AΪϵ������
%bΪ�Ҷ���
function [L, U, x] = zhuigan(A, b)
m = size(A, 1);%ϵ������Ľ���
%%
%���Ƿֽ�
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
%���
y(1) = b(1)/L(1,1);
for i = 2 : m
    y(i) = (b(i)-L(i,i-1)*y(i-1))/L(i,i);
end
x(m) = y(m);
for i = m-1 : -1 : 1
    x(i) = y(i) - U(i,i+1)*x(i+1);
end
end