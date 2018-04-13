clear
k=5;
% % % % % % % % % % % 
axis([-50 50 -50 50]);
grid on;
a=zeros(k,2);
for i=1:1:k
figure(1)
axis([-50 50 -50 50]);
m(i,:)=ginput(1);
plot(m(i,1),m(i,2),'ob');
hold on;
a(i,1:2)=m(i,:);
% a(i,3)=(a(i,1)+a(i,2))*0.2*i;
a(i,3)=0;
figure(2)
plot3(a(i,1),a(i,2),a(i,3),'ob');
grid on;
hold on;
end
figure(1)
plot(m(:,1),m(:,2),'-b');
hold on;
figure(2)
% % % % % % % % % % %
q=zeros(k+1,3);
j=zeros(k+1,k+1);
j(1,1)=0.5;j(1,2)=1;
j(k+1,k+1)=-1;j(k+1,k)=1;
% % % % % % % % % % 
dq1=(a(3,:)-a(1,:))/2;
i=1;
while i<=k;
  q(i+1,:)=a(i,:);
  if i<k;
    j(i+1,i)=1;
    j(i+1,i+1)=4;
    j(i+1,i+2)=1;
  end
 i=i+1;   
end
q(1,:)=(3*a(1,:)-dq1)/12;
q(k+1,:)=(a(k-1,:)-a(k,:))/6;
J=inv(j)
p=6*J*q;
p(k+2,:)=p(k-1,:)-3*p(k,:)+3*p(k+1,:);
%%%
% p(1,:)=a(1,:);p(k+2,:)=a(k,:);
%%%
plot3(p(:,1),p(:,2),p(:,3),'-ok');
getzjyBspline3(p,k+2);







