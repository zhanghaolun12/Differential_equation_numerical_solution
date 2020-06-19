function y = euler2(a,b,n,y0)
h = (b - a)/n;%≤Ω≥§
x = a : h : b;
m = length(x);
y(1) = y0;%≥ı÷µ
for i = 1 : m-1
    y(i+1) = y(i) + h*f2(x(i), y(i));
end
end