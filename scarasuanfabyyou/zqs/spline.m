%------------------�Ǿ���B�������MATLAB����-----------------
clear
k=3;
%x=load('data.txt');
%x = [5,1; 6,6; 7,2; 8,5; 10,0];
x = [0,0; 1,0; 2,1; 3,2; 4,5; 6,6; 7,6];
% x = [1,1; 2,3; 3,4; 4,6; 5,1; 6,6; 7,2; 8,5; 10,0];
[n,m]=size(x);
%-----------�ҳ�����--------------------------------------
u(k+n)=0;
for i=1:n-1
 u(k+i+1)=u(k+i)+sqrt((x(i+1,1)-x(i,1))^2+(x(i+1,2)-x(i,2))^2);
end;
L=u(n+k);
for i=1:n
u(k+i)=u(k+i)/L;
end;
for i=1:3
u(k+i+n)=1;
end
%���ƶ����
plot(x(:,1),x(:,2),'o');
hold on
%------------����n+2�����Ƶ�--------------------
%��λ�ؽڵ�v1=v2
%��λ����ƶ��������
A=zeros(n+2);
A(1,1)=1;A(1,2)=-1;
A(2,2)=1;
A(n+2,n+1)=-1;A(n+2,n+2)=1;
A(n+1,n+1)=1;
for i=3:n
  for j=0:2
    A(i,i+j-1)=Base(i+j-1,k,u,u(i+2));
   end
end
%e:�����ұ�.
e=0;
for i=1:m
    e(n+2,i)=0;
end
for i=1:n
    e(i+1,:)=x(i,:);
end
%������Ƶ�d
d=inv(A)*e;
plot(d(:,1),d(:,2),'g');
hold on
%------------��ֵ��������������-----------------
x=0;y=0;down=0;
iu = [];
for j=1:(n-1)
    uu=(u(j+3)):0.0005:u(j+4);
    iu = [iu;uu(1:end)'];
    for kk=1:length(uu)
       down=down+1;
        x(down)=d(j,1)*Base(j,3,u,uu(kk))+d(j+1,1)*Base(j+1,3,u,uu(kk))+d(j+2,1)*Base(j+2,3,u,uu(kk))+d(j+3,1)*Base(j+3,3,u,uu(kk));
        y(down)=d(j,2)*Base(j,3,u,uu(kk))+d(j+1,2)*Base(j+1,3,u,uu(kk))+d(j+2,2)*Base(j+2,3,u,uu(kk))+d(j+3,2)*Base(j+3,3,u,uu(kk));
    end
end
axis('equal');
plot(x,y,'red');
xlabel('x');ylabel('y');
grid on
figure;
plot(iu,y);
grid on

%------------------------------------------
v = diff(y);
