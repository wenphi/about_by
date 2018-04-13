function pose=getdnurbs(p,u,w,i,t)
pose=(3/(u(1,i+1)-u(1,i)))*((getw(u,w,i-1,2,t)*getw(u,w,i,2,t))/(getw(u,w,i,3,t)^2))*(getp(p,u,w,i,2,t)-getp(p,u,w,i-1,2,t));
end