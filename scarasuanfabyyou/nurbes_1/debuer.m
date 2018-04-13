cishu=3;
value=0.01;
k=4;%µãÊý
i=1;j=1;o=1;t=0;%³õÖµ
a=zeros(k,1);
d=zeros(k,2);
getpoint=zeros(1/value,2);
axis([-50 50 -50 50]);
% g=ginput(k);
g=[-24,0;-12,6;1,8;10,2;12,0];
lx=g(:,1);
ly=g(:,2);
plot(lx,ly);
hold on;
u=[0,0,0,0,0.75,1,1,1,1];

while t<=1;
    while i<=k
    d(i,:)=g(i,:);
    i=i+1;  
    end
    i=1;
while i<=cishu
    while j<=k-i
        if (u(1,j+k)-u(1,j+i))==0
            a(j,1)=0;
        else
            a(j,1)=(t-u(1,i+j))/(u(1,j+k)-u(1,j+i));
        end
    d(j,:)=d(j,:)+a(j,1)*(d(j+1,:)-d(j,:));
    j=j+1;
    end
    j=1;
    i=i+1;
end 
i=1;j=1;
getpoint(o,:)=d(1,:);
o=o+1;
t=t+value;
end
axis([-50 50 -50 50]);
plot(getpoint(:,1),getpoint(:,2),'r');

