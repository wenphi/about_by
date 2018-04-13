% 套用公式做曲线   这个方法第一点必须在原点
k=4;%次数
bian=k;
ttk=0.01;%曲线精度
d=1/ttk;
plot(0,0,'ok');
hold on;
theat=0:0.01:2*pi;
%画出工作区域
x1=250*cos(theat);
y1=250*sin(theat);
x2=400*cos(theat);
y2=400*sin(theat);
plot(x1,y1,x2,y2);
hold on;
axis([-400 400 -400 400]);
grid on;
a=ginput(k);
%%%%%%%%%%%%%%%%%%
c=1;
t=0;
q=zeros(d,2);
qt=zeros(1,2);
while t<=1

while i<=k
    qt(1,1)=a(i,1)*(factorial(k)*t^i*(1-t)^(k-i))/(factorial(k-i)*factorial(i));
    qt(1,2)=a(i,2)*(factorial(k)*t^i*(1-t)^(k-i))/(factorial(k-i)*factorial(i));
    q(c,:)=q(c,:)+qt(1,:);
   i=i+1;
end
i=1;
c=c+1;
t=t+ttk;
end
lx=a(:,1);
ly=a(:,2);
plot(lx,ly);
plot(q(:,1),q(:,2),'r');

