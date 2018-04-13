%p控制点，u节点空间，w权因子，i表示所处在的节点矢量位子，k德布尔递推第几次，t节点变量
function pose=getp_digui(p,u,w,i,k,t)
    if k==1
        pose=(1-geta(u,i,1,t))*(w(1,i-1)/getw(u,w,i,1,t))*p(i-1,:)+geta(u,i,1,t)*(w(1,i)/getw(u,w,i,1,t))*p(i,:);
    else
        pose1=getp_digui(p,u,w,i,k-1,t);
        pose2=getp_digui(p,u,w,i-1,k-1,t);
        pose=(1-geta(u,i,k,t))*(getw(u,w,i-1,k-1,t)/getw(u,w,i,k,t))*pose2+geta(u,i,k,t)*(getw(u,w,i,k-1,t)/getw(u,w,i,k,t))*pose1;
    end
end