clear
data=importdata('/home/ywh/work2/git/emc2/build_x86/tests/qmode3');
sizedata=size(data);
lenth=sizedata(1,1);
xmax=data(lenth,1)+1;
ymax=data(lenth,4)+1;
b=data(:,2:3);

figure (1);
% axis([0,xmax,-20,20]);
hold on;
plot(data(:,1),data(:,2),'-k','LineWidth',2);
legend('a');
grid on;
hold on;
figure(2)
% axis([0,xmax,0,35]);
hold on;
plot(data(:,1),data(:,3),'-k','LineWidth',2);
legend('v');
grid on;
hold on;
figure(3)
% axis([0,xmax,0,ymax]);
hold on;
plot(data(:,1),data(:,4),'-k','LineWidth',2);
legend('s');
grid on;
hold on;
% num=size(data);
% figure(4)
% for i=1:1:num-1
%     plot(data(i,1),(data(i+1,2)-data(i,2))/data(i,1),'.r');
%     grid on;
%     hold on;
% end
