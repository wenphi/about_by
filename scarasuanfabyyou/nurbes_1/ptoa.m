function Y=ptoa(x,y,z,k)
l1=250;l2=150;
e=atan(y/x);
r=sqrt(x^2+y^2);
ck2=(r^2-l1^2-l2^2)/(2*l1*l2);
b=-acos(ck2);
if x>0
cke=(l2*ck2+l1)/r;
a=acos(cke)+e;
elseif x<0&&y>0
cke=(l2*ck2+l1)/r;
a=acos(cke)+e+pi;   
elseif x<0&&y<0
cke=(l2*ck2+l1)/r;
a=acos(cke)+e-pi;      
end
c=z;
d=a+b+k;
Y=[a;b;c;d];
end