clc;
clear;
%%
%�����ֵ����ĳ�ʼ����
a = 0; b = pi;
u0 = 0; um = 0;
h = pi/10;%�ɱ䲽��
x = a : h : b;
%%
%������
ux = exp(x).*sin(x);
%%
%��ֽⷨ
[A,L,U,u] = Two_Points_Diff(a,b,h,u0,um);
e = abs(ux-u); %�������
%���ֽ�㴦����ֵ�⼰���
for i = 1 : 4
    ansu(i) = u(x==(i*pi)/5);
    anse(i) = e(x==(i*pi)/5);
end
plot(x,ux,x,u,'*');
xlabel('x');
ylabel('y');
legend('������','��ֽ�');
title('�����ֵ����');
figure
plot(x,e);
xlabel('x');ylabel('���e');
title('�������');