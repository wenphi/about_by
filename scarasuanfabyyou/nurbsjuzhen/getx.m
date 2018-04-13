% u节点矢量，i参数。k选择类型
function X=getx(u,i,k)
if k==1
    X=u(1,i+1)-u(1,i);
elseif k==2
    X=u(1,i+2)-u(1,i);
elseif k==3
    X=u(1,i+3)-u(1,i);
end