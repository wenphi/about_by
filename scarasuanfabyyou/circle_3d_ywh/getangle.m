function angle=getangle(p1,p2,p3)%得到两线的夹�?
l1=p1-p2;
l2=p3-p2;
absl1=sqrt((l1(1,1)^2)+(l1(1,2)^2)+(l1(1,3)^2));
absl2=sqrt((l2(1,1)^2)+(l2(1,2)^2)+(l2(1,3)^2));
cangle=(l1(1,1)*l2(1,1)+l1(1,2)*l2(1,2)+l1(1,3)*l2(1,3))/(absl1*absl2);
angle=acos(cangle);
end