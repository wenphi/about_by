clear
p1=[200,200,0];
plot3(p1(1,1),p1(1,2),p1(1,3),'ob');
hold on;
p2=[50,100,0];
plot3(p2(1,1),p2(1,2),p2(1,3),'og');
hold on;
p3=[100,20,0];
plot3(p3(1,1),p3(1,2),p3(1,3),'ob');
hold on;

n=getNvel(p1,p2,p3);
xangle=getangle(p1,p2,p3);%得到三点连线的夹角
mline=getNvel(p3-p1,[0,0,0],n);%得到中垂线的单位向量
angle=xangle*2;
disangle=2*pi-2*xangle;
if xangle<pi/2
    mline=-mline;
else
    angle=2*pi-angle;
end
pxian=p3-p1;
xian=getline(pxian);%弦长
R=(xian/2)/sin(angle/2);
center=p1+((p3-p1)/2)+mline*(R*cos(angle/2));
plot3(center(1,1),center(1,2),center(1,3),'ob');
hold on;

%t
getline(mline)
getangle(p1,center,p3)
getline(center-p1)
%t
st=p1;
i=1;
h=geth(0.1,R);
progress=0;
while(progress<(2*pi*R)*(disangle)/(pi*2))
    p(i,:)=st;
    pro=getNvel(n,[0,0,0],center-st);
    st=st+pro*h;
    sc=st-center;
    scnormal=sc/getline(sc);
    st=R*scnormal+center;
    i=i+1;
    progress=progress+h;
end

plot3(p(:,1),p(:,2),p(:,3),'-r');
hold on;
