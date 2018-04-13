k=5;
theat=0:0.01:2*pi;
%画出工作区域
x1=250*cos(theat);
y1=250*sin(theat);
x2=400*cos(theat);
y2=400*sin(theat);
figure(5);
plot(x1,y1,x2,y2);
hold on;
plot(0,0,'ok');
hold on;
axis([-400 400 -400 400]);
grid on;
a=ginput(k);
lx=a(:,1);
ly=a(:,2);
figure(5);
plot(lx,ly,'r');
hold on;
i=1;
m=0;
while i<k
T=getplot(a(i,1),a(i,2),a(i+1,1),a(i+1,2),m);
m=m+T;
i=i+1;
end