
% ����Բ��AOC��Բ�Ľ�AOC
% theta = CalCentralAngle(a,b,c,O,r) 
% 
% a -- Բ����ʼ��
% b -- Բ���м��
% c -- Բ����ֹ��
% O -- Բ����Բ��
% r -- Բ�뾶
% theta -- Բ�Ľ�AOC 


function theta = CalCentralAngle(a,b,c,O,r) 

 % ���㷨����
 AB = a-b;
 BC = b-c;
 n = cross(AB,BC);

 OA = O-a;
 AC = a-c;
 n1 = cross(OA,AC);

 H = dot(n,n1);
 d = (c(1)-a(1)).^2 + (c(2)-a(2)).^2 + (c(3)-a(3)).^2;

 if H<0
    theta = 2*pi - 2*asin(sqrt(d)/(2*r));
 else
    theta = 2*asin(sqrt(d)/(2*r));
 end
    