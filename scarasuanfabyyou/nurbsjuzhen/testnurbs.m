clear
k=5;
n=k-3;
grid on;
d=ginput(5);
plot(d(:,1),d(:,2),'-ob');
hold on;
u=[0,0,0,0.4,0.6,0.8,1,1,1];
w=[1,1,1,1,1];
x=1;
p=zeros(1000,2);
for i=1:1:2
    [ck1,ck2]=nurbsinit(u,w,d,i)
    for tk=0:0.02:1
%         t=(tk-u(:,i))/getx(u,i,1);
t=tk;
        p(x,:)=(ck1(1,:)+ck1(2,:)*t+ck1(3,:)*t^2+ck1(4,:)*t^3)/(ck2(1,:)+ck2(2,:)*t+ck2(3,:)*t^2+ck2(4,:)*t^3);
        x=x+1
    end
end
plot(p(:,1),p(:,2),'-r');
hold on;