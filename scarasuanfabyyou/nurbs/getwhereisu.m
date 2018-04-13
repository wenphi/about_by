% 获得变量所在的区间
function k=getwhereisu(u,i,t)
if t<u(:,i) ||t>=u(:,i+4)
    k=5;
elseif t>=u(:,i)&&t<u(:,i+1)
    k=1;
elseif t>=u(:,i+1)&&t<=u(:,i+2)
    k=2;
elseif t>=u(:,i+2)&&t<=u(:,i+3)
    k=3;
elseif t>=u(:,i+3)&&t<=u(:,i+4)
    k=4;
end
end