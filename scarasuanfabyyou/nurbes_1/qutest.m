 pn=axang2quat([1,0,0,0]);
 qn=axang2quat([2,2,2,3.1415]);
arot = quat2axang(pn);
%pn =ola(pi/4,-2,2,0);
%qn =ola(0,0,1,0);
% for i=0:0.01:1
% qi =quatinterp(pn,qn,i,'slerp');
% [yaw,pitch,row]=quat2angle(qi);    %默认的是zyx的旋转方式；
% R=rotz(yaw)*roty(pitch)*rotx(row);
% trplot(R);
% %hold on;
% pause(0.01);
% end
i=0;
count=0;
while i<1
    qi=quatinterp(pn,qn,i,'slerp');
    R=quat2dcm(qi);
    trplot(R);
     hold on;
    pause(0.01);
    count=count+0.01;
    i=count+i;
end
