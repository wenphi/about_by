% ����������α��������
kt=0.1;
% % % % % % % % % % % 
axis([-50 50 -50 50]);
grid on;
a=ginput(3);
lx=a(:,1);
ly=a(:,2);
plot(lx,ly,'-o');
hold on;
% % % % % % % % % % %
th=pi/3;

w1=0.1;w2=1;w3=0.1;%Ȩ

p=zeros(1/kt,2);
t=0;
x=1;
while t<=1
p(x,:)=((1-t)^2*w1*a(1,:)+2*t*(1-t)*w2*a(2,:)+t^2*w3*a(3,:))/((1-t)^2*w1+2*t*(1-t)*w2+t^2*w3);
x=x+1;
t=t+kt;
end
axis([-50 50 -50 50]);
grid on;
plot(p(:,1),p(:,2),'-or');