%---------------------G-S迭代求解椭圆型方程---------------------%

function [U, iter] = GS(xa,xb,ya,yb,h,u0)
%u0:内部节点的初始值
x = xa : h : xb;
y = ya : h : yb;
n = length(x);
m = length(y);
eps = 0.00001; %精度
%% 左、右边界值
for i = 1 : m
    U(i, 1) = y(i)*(3-y(i));
    U(i, n) = 0;
end

%% 上、下边界值
for j = 1 : n
    U(1, j) = sin((pi/4)*x(j));
    U(m, j) = 0;
end

%% 初始解
for i = 1 : m-2
    for j = 1 : n-2
        U(i+1,j+1) = u0(i,j);
    end
end

%% 迭代求解
iter = 0;
while true
    U_pre = U; %前一次的结果
    for i = 2 : m-1
        for j = 2 : n-1
            U(i,j) = (U_pre(i,j+1)+U(i,j-1)+U_pre(i+1,j)+U(i-1,j))/4;
        end
    end
    e = sqrt(sum((sum(U - U_pre).^2))); %误差
    iter = iter + 1;
    if e < eps
        break;
    end
end
end

