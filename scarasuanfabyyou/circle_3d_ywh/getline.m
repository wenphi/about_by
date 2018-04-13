function getline(p,k,d)

[qian,hou]=getqhpoint(p(1:3,:),d);
h=p(1,:);
for i=1:1:k-2
    p(i,:)
   [qian,hou]=getqhpoint(p(i:i+2,:),d) ;
    plot3([h(1,1),qian(1,1)],[h(1,2),qian(1,2)],[h(1,3),qian(1,3)],'-b');
    hold on;
    getcircle(p(i,:),p(i+1,:),p(i+2,:),d,0.1);
    h=hou;
end
plot3([h(1,1),p(k,1)],[h(1,2),p(k,2)],[h(1,3),p(k,3)],'-b');
end