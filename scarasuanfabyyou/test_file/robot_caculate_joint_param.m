clear
joint_posit=importdata('/home/ywh/Desktop/OUT.TXT');
num=size(joint_posit);
sum=num(1,1);
cycle_time=0.002;
time=1:1:sum;
time=time*cycle_time;
joint_posit(:,2)=joint_posit(:,1);
joint_posit(:,1)=time';
%
prim_posit=joint_posit(1:sum-1,:);
after_posit=joint_posit(2:sum,:);
joint_vel=(after_posit-prim_posit)/joint_posit(1,1);
joint_vel(:,1)=prim_posit(:,1);
num=size(joint_vel);
sum=num(1,1);
%
prim_vel=joint_vel(1:sum-1,:);
after_vel=joint_vel(2:sum,:);
joint_acc=(after_vel-prim_vel)/joint_posit(1,1);
joint_acc(:,1)=prim_vel(:,1);
%
w=1;
if 1
%     figure(1)
%     plot3(cart_pose(:,2),cart_pose(:,3),cart_pose(:,4),'-k','LineWidth',w);
%     legend('cart');
%     grid on;
%     hold on;
    figure(2)
    plot(joint_posit(:,1),joint_posit(:,2),'-k','LineWidth',w);
    hold on;
    grid on;
    legend('joint1');
    if num(1,2)>2
    figure(2)
    plot(joint_posit(:,1),joint_posit(:,3),'-r','LineWidth',w);
    legend('joint2');
    grid on;
    hold on;
    figure(2)
    plot(joint_posit(:,1),joint_posit(:,4),'--r','LineWidth',w);
    legend('joint3');
    grid on;
    hold on;
    figure(2)
    plot(joint_posit(:,1),joint_posit(:,5),'-b','LineWidth',w);
    legend('joint1','joint2','joint3','joint4');
    grid on;
    hold on;
    end
end
    
if 1
    figure(3)
    plot(joint_vel(:,1),joint_vel(:,2),'-k','LineWidth',w);
    legend('joint_vel1')
    grid on;
    hold on;
    if num(1,2)>2
    figure(3)
    plot(joint_vel(:,1),joint_vel(:,3),'-r','LineWidth',w);
    legend('joint_vel2')
    grid on;
    hold on;
    figure(3)
    plot(joint_vel(:,1),joint_vel(:,4),'--r','LineWidth',w);
    legend('joint_vel3')
    grid on;
    hold on;
    figure(3)
    plot(joint_vel(:,1),joint_vel(:,5),'-b','LineWidth',w);
    legend('joint vel1','joint vel2','joint vel3','joint vel4');
    grid on;
    hold on;
    end
end
if 1
    figure(4)
    plot(joint_acc(:,1),joint_acc(:,2),'-k','LineWidth',w);
    legend('joint acc1');
    grid on;
    hold on;
    if Num(1,2)>2
    figure(4)
    plot(joint_acc(:,1),joint_acc(:,3),'-r','LineWidth',w);
    legend('joint acc2');
    grid on;
    hold on;
    figure(4)
    plot(joint_acc(:,1),joint_acc(:,4),'--r','LineWidth',w);
    legend('join acc3');
    grid on;
    hold on;
    figure(4)
    plot(joint_acc(:,1),joint_acc(:,5),'-b','LineWidth',w);
    legend('joint acc1','joint acc2','joint acc3','joint acc4');
    grid on;
    hold on;
    end
end
if 0
    figure(6)
    plot()
end