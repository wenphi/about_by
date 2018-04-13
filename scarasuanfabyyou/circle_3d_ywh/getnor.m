function n=getnor(p,k) %获得一个单位向量
nn=0;
for i=1:1:k;
    nn=(p(1,i)^2)+nn;   
end
nn=sqrt(nn);
n=p/nn;
end