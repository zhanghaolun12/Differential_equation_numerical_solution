%%四级四阶R-K法
function Y = High_RK(a,b,h,Y0)
n = length(Y0); %阶数
x = a : h : b;
m = length(x); %点的个数
for i = 1 : n
    Y(i,1) = Y0(i);
end
for j = 1 : m - 1
    K1 = F(x(j), Y(:, j));
    K2 = F(x(j)+h/2, Y(:, j)+(h/2).*K1);
    K3 = F(x(j)+h/2, Y(:, j)+(h/2).*K2);
    K4 = F(x(i)+h, Y(:, j)+h.*K3);
    Y(:, j+1) = Y(:, j) + (h/6).*(K1+2.*K2+2.*K3+K4);
end