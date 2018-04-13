p2=[65.131044,-259.081908];
p1=[138.598332,-249.016195];
pp=p2-p1;
theta=atan2(pp(:,1),pp(:,2))
ps2=[100.790,155.125];
ps1=[179.172,163.958];
pps=ps2-ps1;
thetas=atan2(pps(:,1),pps(:,2))
% (thetas-theta)
% ref2=p2-ps2;
% ref1=p1-ps1;
% ref3=[-35.4161,-411.440838];
% ref4=(ref1+ref2+ref3)/3
% ref=[ref1;ref2;ref3;ref4];
% plot(ref(:,1),ref(:,2),'-ro');
pose=[p1;p2];
poses=[ps1;ps2];
plot(pose(:,1),pose(:,2),'-ro');
hold on;

plot(poses(:,1),poses(:,2),'-bo');
hold on;
grid on;

