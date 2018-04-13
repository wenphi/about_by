clear
% sva=importdata('/home/ywh/work2/git/emc2/build/tests/motion_test/sva.txt');
% figure (1);
% plot(sva(:,1),sva(:,2),'-r');
% hold on;
% plot(sva(:,1),sva(:,3),'-k');
% hold on;
% plot(sva(:,1),sva(:,4),'-b');
% hold on;
% plot(sva(:,1),sva(:,5),'-g');
% hold on;
% grid on;

pose=importdata('/home/ywh/work2/git/emc2/build/tests/motion_test/a.txt');
figure(2);
% plot3(pose(:,1),pose(:,2),pose(:,3));
plot(pose(:,2),pose(:,3));
hold on;
grid on;