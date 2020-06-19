clc;
clear;
%��΢�ַ���1��ʼ����
a1 = 1; b1 = 2;
y1 = 1; h1 = 0.1;
x1 = a1 : h1 : b1;
Y1 = sqrt(x1.^3/2 + x1./2);%������
%΢�ַ���2��ʼ����
a2 = 0; b2 = 1;
y2 = 2; h2 = 0.1;
x2 = a2 : h2 : b2;
Y2 = sqrt((x2+2).^2 - x2.^2);
%���ú���
[y11, y12, y13, y14] = equation1(a1,b1,h1,y1);
[y21, y22, y23, y24] = equation2(a2,b2,h2,y2);
%��ͼ
%%
plot(x1,Y1);
hold on
plot(x1,y11,'*');
hold on
plot(x1,y12,'+');
hold on
plot(x1,y13,'.');
hold on
plot(x1,y14,'y*');
legend('������','Euler��','�е㷨','P-C��','R-K��');
xlabel('x');
ylabel('y');
%%
figure
plot(x2,Y2);
hold on
plot(x2,y21,'*');
hold on
plot(x2,y22,'+');
hold on
plot(x2,y23,'.');
hold on
plot(x2,y24,'y*');
legend('������','Euler��','�е㷨','P-C��','R-K��');
xlabel('x');
ylabel('y');