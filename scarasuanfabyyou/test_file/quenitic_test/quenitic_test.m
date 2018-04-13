clear
%%%%%%%%%
k=0.01;     %插补精度
w=1;          %线段的宽度
%%%%%%%%%
Tol=2;
s0=0;
st=10;
v0=0;
vt=10;
a0=0;
at=0;
data=zeros(Tol/k+1,5);
add_tool=1;
for t=0:k:Tol
    data(add_tool,1)=t;
    getData=fivenurbes(s0,st,v0,vt,a0,at,t,Tol);
    getData=getData';
    data(add_tool,2:5)=getData;
    add_tool=add_tool+1;
end
figure(1)
plot(data(:,1),data(:,2),'LineWidth',w);
legend('S');
hold on;
grid on;
figure(2)
plot(data(:,1),data(:,3),'LineWidth',w);
legend('V');
hold on;
grid on;
figure(3)
plot(data(:,1),data(:,4),'LineWidth',w);
legend('A');
hold on;
grid on;
figure(4)
plot(data(:,1),data(:,5),'LineWidth',w);
legend('J');
hold on;
grid on;