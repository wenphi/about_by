%  p1 -- 坐标点1
%  p2 -- 坐标点2
%  p3 -- 坐标点3
%  p  -- 圆心坐标
%calc_cr([2,4,0],[8,4,0])
function p = calc_cr(p2,p3)
%计算A1 B1 C1 D1
x2=p2(1); y2=p2(2); z2=p2(3);
x3=p3(1); y3=p3(2); z3=p3(3);
A1=y2*z3-y3*z2;
B1=-x2*z3+x3*z2;
C1=x2*y3-x3*y2;
D1=0;
%disp(['A1 B1 C1 D1=', num2str(A1),' ',num2str(B1),' ',num2str(C1),' ',num2str(D1)]);

%计算A2 B2 C2 D2
A2=2*x2;
B2=2*y2;
C2=2*z2;
D2=-(x2^2+y2^2+z2^2);
%disp(['A2 B2 C2 D2=', num2str(A2),' ',num2str(B2),' ',num2str(C2),' ',num2str(D2)]);

%计算A3 B3 C3 D3
A3=2*x3;
B3=2*y3;
C3=2*z3;
D3=-(x3^2+y3^2+z3^2);
%disp(['A3 B3 C3 D3=', num2str(A3),' ',num2str(B3),' ',num2str(C3),' ',num2str(D3)]);

%求解圆心
mat_abc=[A1 B1 C1;A2 B2 C2;A3 B3 C3];
disp(mat_abc);
%disp('ABC矩阵为：');
%disp(mat_abc);
mat_d=[D1;D2;D3];
%disp('D矩阵为：');
%disp(mat_d);
sss = inv(mat_abc);
disp(sss);
p=-(inv(mat_abc))*mat_d;
%r=sqrt(p(3)^2+p(2)^2+p(1)^2);
%disp(['r=', num2str(r)]);


