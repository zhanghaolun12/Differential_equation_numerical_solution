clc;
clear;
%%
%�߽�΢�ַ��̵ĳ�ʼ����
a = 0; b = 3; h = 0.2;
x = a : h : b;
y1 = 0; y2 = 1;
Y0 = [y1; y2];
%%
%�ļ��Ľ�RK��
Y1 = High_RK(a,b,h,Y0);
%%
%AdamsԤ��-������
Y2 = High_Adams(a,b,h,Y0);
%%
%������
y1 = sin(x);
y2 = cos(x);
%%
%���
e11 = abs(y1-Y1(1,:));
e12 = abs(y1-Y2(1,:));
e21 = abs(y2-Y1(2,:));
e22 = abs(y2-Y2(2,:));
%%
%��ͼ
plot(x,Y1(1,:),'*',x,y1);
xlabel('x'); ylabel('y1');
legend('�ļ��Ľ�RK��','������');
figure
plot(x,Y1(2,:),'*',x,y2);
xlabel('x'); ylabel('y2');
legend('�ļ��Ľ�RK��','������');
figure
plot(x,Y2(1,:),'*',x,y1);
xlabel('x'); ylabel('y1');
legend('AdamsԤ��-������','������');
figure
plot(x,Y2(2,:),'*',x,y2);
xlabel('x'); ylabel('y2');
legend('AdamsԤ��-������','������');
