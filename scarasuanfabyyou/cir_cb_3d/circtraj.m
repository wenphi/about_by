
% Բ���켣�滮
% tt = circtraj(t0, t1, t2,n)
%
% t0 -- Բ����ʼ���Ӧ����α任����
% t1 -- Բ���м���Ӧ����α任����
% t2 -- Բ���������Ӧ����α任����
% n --  �岹����
% tt --  ���岹����α任����

function tt = circtraj(t0, t1, t2,n)
        
    p0 = transl(t0);
    p1 = transl(t1);
    p2 = transl(t2);
    N = n;
    
    pr = CirInterpolation(p0',p1',p2',N);  %λ�ò岹��Բ���岹�㷨
    
    q0 = quaternion(t0);
  % q1 = quaternion(t1);       % �ò���δʹ��            
    q2 = quaternion(t2);
    
    tt = zeros(4,4,0);
    for i=1:1:N,    
        
        r=(i-1)/(n-1);
	    qr = qinterp(q0, q2, r);          %��̬�岹���������Բ�ֵ��
        
	    t = [qr.r pr(i,:)'; 0 0 0 1];
       
	    tt = cat(3, tt, t);      %��ά���󣬼����岹�����α任����
   end
    
    