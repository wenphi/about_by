syms  a1 a2 d a4  da1 da2 da4 d  dd ddd t  b1 b2 b3 b4 b5 b6 e1 e2 e3 e4 e5 e6 p1 p2 p3 p4 p5 p6 f1 f2 f3 f4 f5 f6
%每段的质量
m1=3.2;m2=1.3;m3=1.8;m4=0.5;
%质心的距离
j1=0.125;j2=0.05;j3=0.005;j4=0.001;
%臂长
l1=0.25;l2=0.08;l3=0.07;
%转动惯量
i1=m1*j1^2;i2=m2*j2^2;i3=m3*j3^2;i4=m4*j4^2;
%重力加速度
g=9.8;
%质心到最低面的距离
h1=0.1;h2=0.15;h3=0.15;h4=0.05;
%四个关节的运动函数
a1=b1+b2*t+b3*t^2+b4*t^3+b5*t^4+b6*t^5; 

a2=e1+e2*t+e3*t^2+e4*t^3+e5*t^4+e6*t^5; 

d=p1+p2*t+p3*t^2+p4*t^3+p5*t^4+p6*t^5; 

a1=f1+f2*t+f3*t^2+f4*t^3+f5*t^4+f6*t^5; 
%四个关节的速度函数
da1=diff(a1,'t');
da2=diff(a2,'t');
dd=diff(d,'t');
da4=diff(a4,'t');
%四个关节的加速度函数
dda1=diff(da1,'t');
dda2=diff(da2,'t');
ddd=diff(dd,'t');
dda4=diff(da4,'t');

% vx=(-l1*sin(a1)-(l2+l3)*sin(a1+a2))*da1-(l2+l3)*sin(a1+a2)*da2;
% vy=(-l1*cos(a1)-(l2+l3)*cos(a1+a2))*da1-(l2+l3)*cos(a1+a2)*da2;
% vz=dd;
% dtheta=da1+da2+da4;

%质点速度的平方
v2=l1*da1^2+j2^2*(da1+da2)^2+2*l1*j2*cos(a2)*(da1+da2)*da1;
v3=l1*da1^2+l2^2*(da1+da2)^2+2*l1*l2*cos(a2)*(da1+da2)*da1+dd^2;
v4=l1*da1^2+(l2+l3)^2*(da1+da2)^2+2*l1*(l2+l3)*cos(a2)*(da1+da2)*da1+dd^2;
%求每一段的动能
k1=i1*da1^2/2;
k2=i2*(da1+da2)^2/2+m2*v2/2;
% k3=i3*(da1+da2)^2/2+m3*v3/2;
k3=m3*v3/2;
k4=i4*(da1+da2+da4)^2/2+m4*v4/2;
%每一段的势能
u1=m1*g*h1;
u2=m2*g*h2;
u3=m3*g*(h3+d);
u4=m4*g*(h4+d);
%拉格朗日算子
L=k1+k2+k3+k4-u1-u2-u3-u4;
%关节一的力矩求解
dL1=diff(L,'t');
dLk1=diff(L,'a1');
ddL1=dL1/dda1;
t1=ddL1-dLk1;
%关节2的力矩求解
dL2=diff(L,'t');
dLk2=diff(L,'a2');
ddL2=dL2/dda2;
t2=ddL2-dLk2;
%关节3的力求解
dL3=diff(L,'t');
dLk3=diff(L,'d');
ddL3=dL3/ddd;
f3=ddL3-dLk3;
%关节4的力矩求解
dL4=diff(L,'t');
dLk4=diff(L,'a4');
ddL4=dL4/dda4;
t4=ddL4-dLk4;
J=[t1;t2;f3;t4]





