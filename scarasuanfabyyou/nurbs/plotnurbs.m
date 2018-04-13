clear
k=6;
n=k-3;
w=zeros(1,k);
u=zeros(1,k+4);
point=zeros(100,2);
% p=zeros(k,2);
p=ginput(k);
plot(p(:,1),p(:,2),'-ob');
hold on;
u=[0,0,0,0,0.5,0.8,1,1,1,1];
w=[1,1,1,1,1,1];
x=1;
for t=0:0.001:1
point(x,:)=getpoint(u,w,p,t,n);
x=x+1;
end
plot(point(:,1),point(:,2),'.r')