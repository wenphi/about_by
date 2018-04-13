function i=geti(u,t,num,k)
if t==0
    i=k+1;
end
for a=k+1:1:num+k
    if t>u(1,a)&&t<=u(1,a+1)
        i=a;
        break;
    end
end
end