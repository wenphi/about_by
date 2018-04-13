function y=getnorvel(p1,p2,p3)%得到角平线的单位向量
pp1=p1-p2;
abpp1=sqrt(pp1(1,1)^2+pp1(1,2)^2+pp1(1,3)^2);
pp1=pp1/abpp1;
pp2=p3-p2;
abpp2=sqrt(pp2(1,1)^2+pp2(1,2)^2+pp2(1,3)^2);
pp2=pp2/abpp2;
pz=pp2+pp1;
abspz=sqrt(pz(1,1)^2+pz(1,2)^2+pz(1,3)^2);
y=pz/abspz;
end