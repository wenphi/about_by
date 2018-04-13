%采用几何法作出的贝齐尔曲线
k=6;%次数
bian=k;
ttk=0.001;%曲线精度
c=1/ttk;
theat=0:0.01:2*pi;
hold on;
axis([-400 400 -400 400]);
grid on;
a=ginput(k);
t=0;
lx=a(:,1);
ly=a(:,2);
plot(lx,ly,'-o');
q1=zeros(k,2);
q2=zeros(k,2);
q3=zeros(c,2);
i=1;
b=1;
while t<=1
    bian=k;
while i<=bian
    q1(i,:)=a(i,:);
    i=i+1;
end
i=1;
 while bian>=2 
while i<bian
    q2(i,1)=(q1(i+1,1)-q1(i,1))*t+q1(i,1); 
    q2(i,2)=(q1(i+1,2)-q1(i,2))*t+q1(i,2);   
    i=i+1;
    
end
     i=1;
while i<k
    q1(i,:)=q2(i,:);
    i=i+1;
end
i=1;
bian=bian-1;
 end
 q3(b,:)=q2(1,:);
b=b+1;
t=t+ttk;
end
plot(q3(:,1),q3(:,2),'r');
axis([-400 400 -400 400]);
hold on;