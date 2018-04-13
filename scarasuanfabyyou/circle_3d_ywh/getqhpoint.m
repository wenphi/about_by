function [qian,hou]=getqhpoint(p,d) %de dao qian hou dian de xiangliang zuo biao
    angle=getangle(p(1,:),p(2,:),p(3,:));
    l1=getnor(p(1,:)-p(2,:),3);
    l2=getnor(p(3,:)-p(2,:),3);
    r=(d*sin(angle/2))/(1-sin(angle/2));
    lk1=(r+d)*cos(angle/2);
    qian=lk1*l1;
    qian=qian+p(2,:);
    hou=lk1*l2;
    hou=hou+p(2,:);
end