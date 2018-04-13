%圆弧插补顶层模块
%圆弧起点坐标为（0,0,0）
%i1,i2为圆弧上面的两点
%top([200,400,500],[800,400,500])
%top([2,4,0],[8,4,0])
%top([3,4,0],[1.5,2,2.5])
%top([4,8,0],[16,8,0])
%top([4,8,8],[16,20,8])
%

function top(i1,i2)

%计算圆心和半径
cir_cen=calc_cr(i1,i2);
cir_r=sqrt(cir_cen(1)^2+cir_cen(2)^2+cir_cen(3)^2);
disp(['Xc=',num2str(cir_cen(1)),'  Yc=',num2str(cir_cen(2)),'  Zc=',num2str(cir_cen(3))]);
disp(['r= ', num2str(cir_r)]);

%计算delta theta,1-cos(theta),sin(theta)
sigma=0.1;               %精度控制参数sigma
dt_th=sqrt(8)*sigma/cir_r;
disp(['dt_th= ', num2str(dt_th)]);
sin_th=dt_th-dt_th^3/6;
lsin_th=sin(dt_th);
disp(['sin_th= ', num2str(sin_th),'    理论sin_th=',num2str(lsin_th)]);
ocos_th=dt_th^2/2;
locos_th=1-cos(dt_th);
disp(['1-cos(theta)= ', num2str(ocos_th),'   理论1-cos(theta)= ', num2str(locos_th)]);

%计算cos(alpha),cos(beta),cos(gamma)
%p平面方程A,B,C参数
A=i1(2)*i2(3)-i1(3)*i2(2);
B=i1(3)*i2(1)-i1(1)*i2(3);
C=i1(1)*i2(2)-i1(2)*i2(1);
cos_ap=-A/(sqrt(A^2+B^2+C^2));
cos_bt=-B/(sqrt(A^2+B^2+C^2));
cos_gm=-C/(sqrt(A^2+B^2+C^2));
disp(['平面方程参数ABC=',num2str(A),' ',num2str(B),' ',num2str(C)]);
disp(['cos_alpha= ', num2str(cos_ap)]);
disp(['cos_beta= ', num2str(cos_bt)]);
disp(['cos_gamma= ', num2str(cos_gm)]);

%计算寻找插补次数
degree=2*asin((sqrt(i2(1)^2+i2(2)^2+i2(3)^2))/(2*cir_r));
k=roundn(degree/dt_th,0);
disp(['弧度= ', num2str(degree),'  插补个数= ', num2str(k)]);

%循环输出插补点
x=0;y=0;z=0;
disp(['i=  0','  x=',num2str(x),'  y=',num2str(y),'  z=',num2str(z)]);
plot3(0,0,0,'*');
hold on;
for i=1:1:k
   dt_x=sin_th*((y-cir_cen(2))*cos_gm-(z-cir_cen(3))*cos_bt)-ocos_th*(x-cir_cen(1));
   dt_y=sin_th*((z-cir_cen(3))*cos_ap-(x-cir_cen(1))*cos_gm)-ocos_th*(y-cir_cen(2));
   dt_z=sin_th*((x-cir_cen(1))*cos_bt-(y-cir_cen(2))*cos_ap)-ocos_th*(z-cir_cen(3));
   plot3(x+dt_x,y+dt_y,z+dt_z,'*');
   hold on;
   plot3([x,x+dt_x],[y,y+dt_y],[z,z+dt_z],'r','LineWidth',2);
   hold on;
   x=x+dt_x;
   y=y+dt_y;
   z=z+dt_z;
   disp(['i=  ',num2str(i),'  x=',num2str(x),'  y=',num2str(y),'  z=',num2str(z)]);
end
%-------------------------------------------理论圆弧-----------------------------------------------
%cir_cen=calc_cr([1.5,2.0,-2.5],[3.0,4.0,0]);
cir_cen=calc_cr(i1,i2);
cir_r=sqrt(cir_cen(1)^2+cir_cen(2)^2+cir_cen(3)^2);
%disp(['Xc=',num2str(cir_cen(1)),'  Yc=',num2str(cir_cen(2)),'  Zc=',num2str(cir_cen(3))]);
%disp(['r= ', num2str(cir_r)]);

%计算delta theta,1-cos(theta),sin(theta)
sigma=0.05;               %精度控制参数sigma
dt_th=sqrt(8)*sigma/cir_r;
%disp(['dt_th= ', num2str(dt_th)]);
sin_th=sin(dt_th);
%lsin_th=sin(dt_th);
%disp(['sin_th= ', num2str(sin_th),'    理论sin_th=',num2str(lsin_th)]);
ocos_th=1-cos(dt_th);
%locos_th=1-cos(dt_th);
%disp(['1-cos(theta)= ', num2str(ocos_th),'   理论1-cos(theta)= ', num2str(locos_th)]);

%计算cos(alpha),cos(beta),cos(gamma)
%p平面方程A,B,C参数
A=i1(2)*i2(3)-i1(3)*i2(2);
B=i1(3)*i2(1)-i1(1)*i2(3);
C=i1(1)*i2(2)-i1(2)*i2(1);
%cos_ap=A/(sqrt(A^2+B^2+C^2));
%cos_bt=B/(sqrt(A^2+B^2+C^2));
%cos_gm=C/(sqrt(A^2+B^2+C^2));
%disp(['平面方程参数ABC=',num2str(A),' ',num2str(B),' ',num2str(C)]);
%disp(['cos_alpha= ', num2str(cos_ap)]);
%disp(['cos_beta= ', num2str(cos_bt)]);
%disp(['cos_gamma= ', num2str(cos_gm)]);

%计算寻找插补次数
degree=2*asin((sqrt(i2(1)^2+i2(2)^2+i2(3)^2))/(2*cir_r));
%k=roundn((degree+pi)/dt_th,0);
k=roundn(2*pi/dt_th,0);
%disp(['弧度= ', num2str(degree),'  插补个数= ', num2str(k)]);

%循环输出插补点
x=0;y=0;z=0;
%disp(['i=  0','  x=',num2str(x),'  y=',num2str(y),'  z=',num2str(z)]);
for i=1:1:k
   dt_x=sin_th*((y-cir_cen(2))*cos_gm-(z-cir_cen(3))*cos_bt)-ocos_th*(x-cir_cen(1));
   dt_y=sin_th*((z-cir_cen(3))*cos_ap-(x-cir_cen(1))*cos_gm)-ocos_th*(y-cir_cen(2));
   dt_z=sin_th*((x-cir_cen(1))*cos_bt-(y-cir_cen(2))*cos_ap)-ocos_th*(z-cir_cen(3));
   %disp(['dt_x= ', num2str(dt_x)]);
   %disp(['dt_y= ', num2str(dt_y)]);
   plot3([x,x+dt_x],[y,y+dt_y],[z,z+dt_z],'LineWidth',1);
   hold on;
   x=x+dt_x;
   y=y+dt_y;
   z=z+dt_z;
   %disp(['i=  ',num2str(i),'  x=',num2str(x),'  y=',num2str(y),'  z=',num2str(z)]);
end
grid on;

%图片后期处理
plot3(cir_cen(1),cir_cen(2),cir_cen(3),'.');
plot3([cir_cen(1),0],[cir_cen(2),0],[cir_cen(3),0],'LineWidth',1);
plot3([cir_cen(1),i2(1)],[cir_cen(2),i2(2)],[cir_cen(3),i2(3)],'LineWidth',1);
