clear
%速度加速度
figure (1);
data=importdata('/home/ywh/emc2_work/a.txt');
plot(data(:,1),data(:,2),'-r');
hold on;
plot(data(:,1),data(:,3),'-k');
hold on;
plot(data(:,1),data(:,4),'-b');
hold on;
datavel=importdata('/home/ywh/emc2_work/vel.txt');
plot(datavel(:,1),datavel(:,2)/0.02,'-g');
hold on;
legend('s','v','a','chord vel');
grid on;
%样条曲线
figure (2);
hold on;
grid on;
datab=importdata('/home/ywh/emc2_work/b.txt');
plot3(datab(:,1),datab(:,2),datab(:,3),'-ob');
plot3(data(:,5),data(:,6),data(:,7),'-or');
legend('nurbs')
hold on;
%弓高误差
figure(3);
data3=importdata('/home/ywh/emc2_work/c.txt');
plot(data3(:,1),data3(:,2),'-r');
legend('chordError');
hold on;
grid on;
%曲率
figure(4)
data4=importdata('/home/ywh/emc2_work/d.txt');
plot(data4(:,1),data4(:,2),'-r');
legend('curvature');
hold on;
grid on;

