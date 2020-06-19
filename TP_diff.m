clc;
clear;
%%
%两点边值问题的初始条件
a = 0; b = pi;
u0 = 0; um = 0;
h = pi/10;%可变步长
x = a : h : b;
%%
%解析解
ux = exp(x).*sin(x);
%%
%差分解法
[A,L,U,u] = Two_Points_Diff(a,b,h,u0,um);
e = abs(ux-u); %绝对误差
%部分结点处的数值解及误差
for i = 1 : 4
    ansu(i) = u(x==(i*pi)/5);
    anse(i) = e(x==(i*pi)/5);
end
plot(x,ux,x,u,'*');
xlabel('x');
ylabel('y');
legend('解析解','差分解');
title('两点边值问题');
figure
plot(x,e);
xlabel('x');ylabel('误差e');
title('误差曲线');