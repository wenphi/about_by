clear
data=importdata('/home/ywh/work2/b.txt');
plot(data(:,1),data(:,2),'--b');
hold on;
plot(data(:,1),data(:,3)/0.02,'-g');
hold on;
plot (data(:,1),data(:,4),'-r');
hold on;
grid on;