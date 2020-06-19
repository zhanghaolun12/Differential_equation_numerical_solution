%---------------------G-S���������Բ�ͷ���---------------------%

function [U, iter] = GS(xa,xb,ya,yb,h,u0)
%u0:�ڲ��ڵ�ĳ�ʼֵ
x = xa : h : xb;
y = ya : h : yb;
n = length(x);
m = length(y);
eps = 0.00001; %����
%% ���ұ߽�ֵ
for i = 1 : m
    U(i, 1) = y(i)*(3-y(i));
    U(i, n) = 0;
end

%% �ϡ��±߽�ֵ
for j = 1 : n
    U(1, j) = sin((pi/4)*x(j));
    U(m, j) = 0;
end

%% ��ʼ��
for i = 1 : m-2
    for j = 1 : n-2
        U(i+1,j+1) = u0(i,j);
    end
end

%% �������
iter = 0;
while true
    U_pre = U; %ǰһ�εĽ��
    for i = 2 : m-1
        for j = 2 : n-1
            U(i,j) = (U_pre(i,j+1)+U(i,j-1)+U_pre(i+1,j)+U(i-1,j))/4;
        end
    end
    e = sqrt(sum((sum(U - U_pre).^2))); %���
    iter = iter + 1;
    if e < eps
        break;
    end
end
end

