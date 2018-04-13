clear
data=importdata('/home/ywh/Document/old_emc/build/tests/a.txt');

b=data(:,2:3);
figure (1);
plot(data(:,1),data(:,2),'-r');
hold on;
plot(data(:,1),data(:,3),'-k');
hold on;
plot(data(:,1),data(:,4),'-b');
hold on;
legend('s','v','a');
grid on;
figure (2);
grid on;
[a,b]=size(data);
plot3(data(:,5),data(:,6),data(:,7),'-r');
hold on;



% p=[20,105,96;
%     15,13,19
%     80,3,66
%    ];
% plot3(p(:,1),p(:,2),p(:,3),'ob');
% hold on;
