a=1;
for i=-5*pi/6:0.1:5*pi/6%外圆
center(a,1)=250*cos(i);
center(a,2)=250*sin(i);
t=1;
for  tt=-5*pi/6:0.1:pi*5/6;
two(t,1)=150*cos(tt);
two(t,2)=150*sin(tt);
t=t+1;
end
two(:,1)=two(:,1)+center(a,1);
two(:,2)=two(:,2)+center(a,2);
plot(two(:,1),two(:,2),'-b');
hold on;
a=a+1;
end
plot(center(:,1),center(:,2),'-r')
hold on;

