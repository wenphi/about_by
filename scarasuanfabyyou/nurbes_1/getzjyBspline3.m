function getzjyBspline3(g,k)
% %׼����3��b����
% k=6;
set=2*2;%lidiangeshu
i=1;
a=zeros(k,3);
%qianhoufuzhi
% while i<=set/2
% a(i,:)=g(1,:);
% a(k+set+1-i,:)=g(k,:);
% i=i+1;
% end
i=1;
%
while i<=k;
   a(i,:)=g(i,:); 
    i=i+1;
end
i=1;
while i<k-2;
   
     Bspline3(a(i,1),a(i,2),a(i,3),a(i+1,1),a(i+1,2),a(i+1,3),a(i+2,1),a(i+2,2),a(i+2,3),a(i+3,1),a(i+3,2),a(i+3,3));
   
     i=i+1;
end 
end
