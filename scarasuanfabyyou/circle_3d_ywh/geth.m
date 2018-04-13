function h=geth(s,r)%得到切向量前进的距离
sangle=((s/2)/r);
angle=asin(sangle);
h=tan(angle*2)*r;
end


