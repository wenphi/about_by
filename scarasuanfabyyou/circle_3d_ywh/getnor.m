function n=getnor(p,k) %���һ����λ����
nn=0;
for i=1:1:k;
    nn=(p(1,i)^2)+nn;   
end
nn=sqrt(nn);
n=p/nn;
end