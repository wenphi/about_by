function getcircle(p1,p2,p3,d,dis)%得到内切的空间圆
angle=getangle(p1,p2,p3);%de dao jia jiao
r=(d*sin(angle/2))/(1-sin(angle/2));%de dao ban jing
pz=getnorvel(p1,p2,p3);%de dao jiao pin fen xian 
center=p2+(d+r)*pz;%de dao yuan xin
n=getNvel(p1,p2,p3);%de dao suo zai mian de fa xiang liang 
[st,en]=getqhpoint([p1;p2;p3],d);
star=st;
% plot3([p1(1,1),star(1,1)],[p1(1,2),star(1,2)],[p1(1,3),star(1,3)],'-b');
% hold on;
End=en;
% plot3([p3(1,1),End(1,1)],[p3(1,2),End(1,2)],[p3(1,3),End(1,3)],'-b');
% hold on;
k=0;
i=1;
h=geth(dis,r);%每次前进的距离
while(k<(pi-angle))
    p(i,:)=st;
    pro=getNvel(n,[0,0,0],center-st);
    st=st+pro*h;
    st=r*getnor(st-center,3)+center;
    i=i+1;
    k=getangle(star,center,st); 
end
p(i,:)=End;
plot3(p(:,1),p(:,2),p(:,3),'-r');
hold on;

end