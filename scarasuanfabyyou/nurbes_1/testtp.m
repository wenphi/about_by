clear
data=importdata('/home/ywh/Desktop/vscodegit_1/a.txt');%写入a.TXT的文件位置
data(:,1)=data(:,1)+300;
figure(2);
k=size(data);
plot(data(:,1),data(:,2),'--g');
hold on;
plot(data(:,1),data(:,3),'--k');
hold on;
plot(data(:,1),data(:,9),'r');
hold on;
plot(data(:,1),data(:,8),'b');
hold on;
legend('x轴st曲线','y轴st曲线','a','速度变化曲线');
grid on;

% % % 画出工作区域
figure(1)
plot(data(:,2),data(:,3),'-r');
hold on;