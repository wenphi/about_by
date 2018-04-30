clear
motor_deg=18000;
motor_acc_time=145;
rate=50;

%%
joint_vel=(motor_deg/(2*motor_acc_time))/0.36;
joint_vel=joint_vel*2*pi/rate
joint_acc=joint_vel/(motor_acc_time/1000)