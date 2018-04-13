%3次nurbs曲线获得曲率
function k=getk(p,u,w,t)
    eps=1e-05;
    if t<=eps
        k=0;
    elseif t>=1-eps
        k=0;
    else
        dq1=getp(p,u,w,3,t+eps/2)-getp(p,u,w,3,t-eps);
        dq2=getp(p,u,w,3,t+eps)-getp(p,u,w,3,t-eps/2);
        dq=getp(p,u,w,3,t+eps/2)-getp(p,u,w,3,t-eps/2);
        ddq=dq2-dq1;
        temp=cross(dq,ddq);
        k=sqrt((norm(temp))/(norm(dq)^3));
    end
end