function dis=gethuchang(p,d)
    angle=getangle(p(1,:),p(2,:),p(3,:));
    r=(d*sin(angle/2))/(1-sin(angle/2));
   dis=(2*pi*r)*((pi-angle)/(2*pi));

end