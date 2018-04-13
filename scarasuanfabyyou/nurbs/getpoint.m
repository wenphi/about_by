% u=节点矢量
%w=权 
%p=控制点
%t=变量
% n=线段个数
function C=getpoint(u,w,p,t,n)
A=zeros(1,2);
C=zeros(1,2);
B=0;
for i=1:1:n+3
    N=getN(u,i,t);
    A=A+N*w(1,i)*p(i,:);
    B=B+N*w(1,i);
end
if B~=0
    C=A/B;
end
end