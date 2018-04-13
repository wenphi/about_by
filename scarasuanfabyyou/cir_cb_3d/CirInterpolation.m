
%  �ռ�Բ���岹����
%  p = CirInterpolation(p1,p2,p3,N)
%  
%  p1 -- Բ����ʼ��
%  p2 -- Բ���м��
%  p3 -- Բ����ֹ�㣨ע��p1,p2,p3�����㲻��ͬһֱ���ϣ�
%  N --  �岹����
%  p --  �岹����� 


function p = CirInterpolation(p1,p2,p3,N)

 a = p1;
 b = p2;
 c = p3;

 O = CalCircleCenter(a,b,c);          % �����a,b,c����Բ��Բ������O
 R = Distance(a,O);                   % ����Բ�뾶R
 theta = CalCentralAngle(a,b,c,O,R);  % ����Բ����Ӧ��Բ�Ľ�theta
 
 % ����Բ��ƽ��ķ�����n
 AB = a-b;
 BC = b-c;
 n = cross(AB,BC);

 u = n(1);
 v = n(2);
 w = n(3);

 delta = theta/(N-1);             % �����
 ds = delta*R;                    % �岹��Բ�������ƶ�����
 E = ds/( R*sqrt(u.^2+v.^2+w.^2));
 G = R/sqrt(R.^2+ds.^2);

 xO = O(1);
 yO = O(2);
 zO = O(3);

 p(1,:) = a;          % Բ����ʼ����
 p(N,:) = c;          % Բ����������

 % �����м�岹��
for i=1:1:N-2,
    
  xi = p(i,1);
  yi = p(i,2);
  zi = p(i,3);

  mi = v*(zi-zO)-w*(yi-yO);
  ni = w*(xi-xO)-u*(zi-zO);
  li = u*(yi-yO)-v*(xi-xO);
  
  x = xO + G*(xi + E*mi-xO);
  y = yO + G*(yi + E*ni-yO);
  z = zO + G*(zi + E*li-zO);

  p(i+1,:) = [x y z]; 
  
end






