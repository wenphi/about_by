function n=getNvel(p1,p2,p3)%获得法相向量 
l1=p1-p2;
l2=p3-p2;
n=[(l1(1,2)*l2(1,3)-l1(1,3)*l2(1,2)),(l1(1,3)*l2(1,1)-l1(1,1)*l2(1,3)),(l1(1,1)*l2(1,2)-l1(1,2)*l2(1,1))];
nn=sqrt(n(1,1)^2+n(1,2)^2+n(1,3)^2);
n=n/nn;
% l1=l1+l2;
% test=n(1,1)*l1(1,1)+n(1,2)*l1(1,2)+n(1,3)*l1(1,3)
end