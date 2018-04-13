function y=pointtoangle(x,y)
syms c1 c2 ;
format short
l1=250;l2=150;
xz=x;
yz=y;
if(xz^2+yz^2)<=160000&&(xz^2+yz^2)>=10000;
A={250*cos(c1)+150*cos(c2+c1)==xz,250*sin(c1)+150*sin(c2+c1)==yz};
s=[c1 c2];
s=solve(A{:});
s=[s.c1,s.c2];
a=s(1,1);
b=s(1,2);
y=vpa([a;b]);

xt=l1*cos(a)+l2*cos(a+b);
yt=l1*sin(a)+l2*sin(a+b);
end

end