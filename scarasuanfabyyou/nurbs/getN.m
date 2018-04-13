% 获得第i个，节点变量为u的基函数值
function N=getN(u,i,t)
if (u(1,i+1)-u(1,i))~=0
    a1=(t-u(1,i))/(u(1,i+1)-u(1,i));
else
    a1=0;
end
if (u(1,i+2)-u(1,i+1))~=0
    a2=(t-u(1,i+1))/(u(1,i+2)-u(1,i+1));
else
    a2=0;
end
if (u(1,i+3)-u(1,i+2))~=0
    a3=(t-u(1,i+2))/(u(1,i+3)-u(1,i+2));
else
    a3=0;
end
if (u(1,i+2)-u(1,i+1))~=0
    b1=(u(1,i+2)-t)/(u(1,i+2)-u(1,i+1));
else
    b1=0;
end
if (u(1,i+3)-u(1,i+2))~=0
    b2=(u(1,i+3)-t)/(u(1,i+3)-u(1,i+2));
else
    b2=0;
end
if (u(1,i+4)-u(1,i+3))~=0
    b3=(u(1,i+4)-t)/(u(1,i+4)-u(1,i+3));
else
    b3=0;
end
k=getwhereisu(u,i,t);
if k==1
    N=a1^3;
elseif k==2
    N=(a1^2+a1*a2+a2^2)*b1;
elseif k==3
    N=(a1+a2+a3)*b1*b2;
elseif k==4
    N=b1*b2*b3;
elseif k==5
    N=0;
end
end