function Bspline2(x1,y1,x2,y2,x3,y3)
kt=0.001;
kq=1/kt;
m=[1,1,0;-2,2,0;1,-2,1];
di=[x1,y1;x2,y2;x3,y3];
q=zeros(kq,2);
i=1;
t=0;
while t<=1
   q(i,:)=1/2*[1,t,t^2]*m*di;
   i=i+1;
   t=t+kt; 
end
plot(q(:,1),q(:,2),'r');
