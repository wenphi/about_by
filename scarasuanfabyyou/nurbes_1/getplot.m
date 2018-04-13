function T=getplot(x1,y1,x2,y2,m)
t=0;
%%%%%%%%%%%%%%%%
kt=0.01;
ff=1;
kf=1/kt;
f1=zeros(kf,2);
f2=zeros(kf,2);
df1=zeros(kf,2);
df2=zeros(kf,2);
ddf1=zeros(kf,2);
ddf2=zeros(kf,2);
F=zeros(kf,4);
xyz=zeros(kf,2);
%%%%%%%%%%%%%%
l1=250;l2=150;
point1.x=x1;
point1.y=y1;
point2.x=x2;
point2.y=y2;
k=sqrt((point2.x-point1.x)^2+(point2.y-point1.y)^2)/30;%得到直线速度；
%进行逆解求角度
k1=ptoa(point1.x,point1.y,0,0);
k2=ptoa(point2.x,point2.y,0,0);
%%得到角度后进行五次多项式运动求速度加速度等曲线；
while t<k
y1=fivenurbes(k1(1,1),k2(1,1),0,0,0,0,k,t);%theta1的变化曲线
y2=fivenurbes(k1(2,1),k2(2,1),0,0,0,0,k,t);%theta2的变化曲线
f=getf(k1(1,1),k2(1,1),k1(2,1),k2(2,1),k,t);%力矩曲线；
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%画出角的曲线
% figure(1);%角的变化量
% plot(t+m,y1(1,1),'.r',t+m,y2(1,1),'.g');
% hold on;
%  figure(2);%角速度
% plot(t+m,y1(2,1),'.r',t+m,y2(2,1),'.g');
% hold on;
%  figure(3);%角加速度
% plot(t+m,y1(3,1),'.r',t+m,y2(3,1),'.g');
% hold on;
% figure(4);%力矩
% plot(t+m,f(1,1),'.r',t+m,f(2,1),'.g');
%  axis([-inf inf -10^6 10^6]);
% hold on;
% %画出线曲线
% x=l1*cos(y1(1,1))+l2*cos(y1(1,1)+y2(1,1));
% y=l1*sin(y1(1,1))+l2*sin(y1(1,1)+y2(1,1));
% figure(5);
% plot(x,y,'.b');
% axis([-400 400 -400 400]);
% hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f1(ff,:)=[t+m,y1(1,1)];
f2(ff,:)=[t+m,y2(1,1)];
df1(ff,:)=[t+m,y1(2,1)];
df2(ff,:)=[t+m,y2(2,1)];
ddf1(ff,:)=[t+m,y1(3,1)];
ddf2(ff,:)=[t+m,y2(3,1)];
F(ff,:)=[t+m,f(1,1),t+m,f(2,1)];
xyz(ff,:)=[l1*cos(y1(1,1))+l2*cos(y1(1,1)+y2(1,1)),l1*sin(y1(1,1))+l2*sin(y1(1,1)+y2(1,1))];
ff=ff+1;
t=t+kt;
end
T=k;
%%%%%%%%%%%%%%%%%%%
figure(1);
plot(f1(:,1),f1(:,2),'r',f2(:,1),f2(:,2),'b');
hold on;
% figure(2);
% plot(df1(:,1),df1(:,2),'r',df2(:,1),df2(:,2),'b');
% hold on;
% figure(3);
% plot(ddf1(:,1),ddf1(:,2),'r',ddf2(:,1),ddf2(:,2),'b');
% hold on;
% figure(4);
% plot(F(:,1),F(:,2),'r',F(:,3),F(:,4),'b');
% axis([-inf inf -10^3 10^3]);
% hold on;
% figure(5);
% plot(xyz(:,1),xyz(:,2),'b');
% hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end





