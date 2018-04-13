function Bspline3(x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4)
kt=0.0001;
kq=1/kt;
m=[1,4,1,0;-3,0,3,0;3,-6,3,0;-1,3,-3,1];
di=[x1,y1,z1;x2,y2,z2;x3,y3,z3;x4,y4,z4];
plot3(di(:,1),di(:,2),di(:,3),'-ob');
hold on;
q=zeros(kq,3);
i=1;
t=0;
while t<=1
   q(i,:)=1/6*[1,t,t^2,t^3]*m*di;
   i=i+1;
   t=t+kt; 
end
plot3(q(:,1),q(:,2),q(:,3),'-r');
sum=0;
for k=1:1:i-2
    tt=q(k+1,:)-q(k,:);
    t=sqrt(tt(1,1)^2+tt(1,2)^2+tt(1,3)^2);
    sum=sum+t;
end
sum
end