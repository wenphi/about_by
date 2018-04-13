%获得拐点
function point=getexcpoint(p,u,w)
x=1;
c=1;
eps=0.001;
for t=0:eps:1
    k= getk(p,u,w,t);
    if t>=eps&&t<=1-eps        
        if k>getk(p,u,w,t-eps)&&k>getk(p,u,w,t+eps)
            p(1,:)=getp(p,u,w,3,t);
            point(x,:)=[p(1,:),t];
            x=x+1;
        end
    end
    pk(c,:)=[t,k];
    c=c+1;
end
figure(2)
plot(pk(:,1),pk(:,2),'-r');
hold on;
grid on;
end