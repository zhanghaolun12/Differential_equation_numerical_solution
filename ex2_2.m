%%C-N��ָ�ʽ�������ͷ���
clc;
clear;
xa = 0; xb = 1; 
ta = 0; tb = 0.5; 
h = 0.1; k = 0.1; %����
x = xa : h : xb;%λ�ƽڵ�
t = ta : k : tb;%ʱ��ڵ�
[X, T] = meshgrid(x,t);%��������ڵ�
%%
%������
u = exp(-pi^2.*T).*sin(pi.*X);
mesh(X,T,u);
xlabel('x');ylabel('t');zlabel('u');
title('ƫ΢�ַ��̽�����');
%%
%C-N��ֵ��
[A, B, U] = CN(xa,xb,ta,tb,h,k);
figure
mesh(X,T,U);
xlabel('x');ylabel('t');zlabel('u');
title('ƫ΢�ַ�����ֵ��');
%%
%���
e = u - U;
figure
mesh(X,T,e);
xlabel('x');ylabel('t');zlabel('���e');
title('���ֲ�ͼ');
%%
figure
plot(x,u(t==0.2,:),x,U(t==0.2,:),'*');
xlabel('x');ylabel('u');
legend('������','��ֵ��');
title('t=0.2���Ľ�');
figure
plot(x,u(t==0.5,:),x,U(t==0.5,:),'*');
xlabel('x');ylabel('u');
legend('������','��ֵ��');
title('t=0.5���Ľ�');