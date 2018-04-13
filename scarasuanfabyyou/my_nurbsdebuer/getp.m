    %p控制点，u节点空间，w权因子，i表示所处在的节点矢量位子，k德布尔递推第几次，t节点变量
function pose=getp(p,u,w,k,t)
    num=size(p);
    i=geti(u,t,num(1,1),k);
    pose=getp_digui(p,u,w,i,k,t);
end