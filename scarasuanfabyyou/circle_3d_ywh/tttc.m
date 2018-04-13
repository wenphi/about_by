clear
data=importdata('/home/ywh/Desktop/cmake/cpp/c.txt');
plot(data(:,1),data(:,2)/0.02,'--b');
hold on;
plot(data(:,1),data(:,3),'-b');
hold on;
plot (data(:,1),data(:,4),'-r');
hold on;
figure(2)
plot3(data(:,5),data(:,6),data(:,7));
hold on;
grid on;