%%建立偏微分方程
function [c,f,s] = pdefun(x,t,u,ux)
c = [1];
F = 0;
s = F * [0];
f = [ux];
end