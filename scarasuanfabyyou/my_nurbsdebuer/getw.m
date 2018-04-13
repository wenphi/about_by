function wi=getw(u,w,i,k,t)
if k==1
    wi=(1-geta(u,i,1,t))*w(1,i-1)+geta(u,i,1,t)*w(1,i);
else
    temp1=getw(u,w,i,k-1,t);
    temp2=getw(u,w,i-1,k-1,t);
    wi=(1-geta(u,i,k,t))*temp2+geta(u,i,k,t)*temp1;
end
end