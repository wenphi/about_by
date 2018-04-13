
%  ����ռ��в���ͬһֱ�����������Բ��Բ��
%  p = CalCircleCenter(p1,p2,p3)
%
%  p1 -- �����1
%  p2 -- �����2
%  p3 -- �����3
%  p  -- Բ������


function p = CalCircleCenter(p1,p2,p3)

    dPx=p1(1);   
    dQx=p2(1);   
    dRx=p3(1);   
   
    dPy=p1(2);   
    dQy=p2(2);   
    dRy=p3(2);   
   
    dPz=p1(3);   
    dQz=p2(3);   
    dRz=p3(3);   
    
  % ��ƽ�淨����   
    x1=dQx-dPx;   
    x2=dRx-dPx;   
    
    y1=dQy-dPy;   
    y2=dRy-dPy;   
   
    z1=dQz-dPz;   
    z2=dRz-dPz;   
       
    pi=y1*z2-z1*y2;   
    pj=z1*x2-x1*z2;   
    pk=x1*y2-y1*x2;   
    
 if (pi==0)&(pj==0)&(pk==0),  
    error('����һ��');
 end
 
  % ��PQ��PR���д���   
  % ��PQ���е�(Mx,My,Mz),   
 
    dMx=(dPx+dQx)/2;   
    dMy=(dPy+dQy)/2;   
    dMz=(dPz+dQz)/2;   

  % �루Mi,Mj,Mk������pi��pj��pk������x1,y1,z1����ֱ    
    dMi=pj*z1-pk*y1;   
    dMj=pk*x1-pi*z1;   
    dMk=pi*y1-pj*x1;      
    
  % ��PR���е�(Nx,Ny,Nz)   
    dNx=(dPx+dRx)/2;   
    dNy=(dPy+dRy)/2;   
    dNz=(dPz+dRz)/2;   
         
  % �루Ni,Nj,Nk������pi��pj��pk������x2,y2,z2����ֱ         
    dNi=pj*z2-pk*y2;   
    dNj=pk*x2-pi*z2;   
    dNk=pi*y2-pj*x2;
    
  % �õ��������д���Ϊ
  % {X=dMx+dMi*tm;Y=dMy+dMj*tm;Z=dMz+dMk*tm;}  ��(X-dMx)/dMi=(Y-dMy)/dMj=(Z-dMz)/dMk;
  % {X=dNx+dNi*tn;Y=dNy+dNj*tn;Z=dNz+dNk*tn;}  ��(X-dNx)/dNi=(Y-dNy)/dNj=(Z-dNz)/dNk;

 
  %    tm=(dNx+dNi*tn-dMx)/dMi;      
  %    dX0=dMx+dMi*tm;   
  %    dY0=dMy+dMj*tm;   
  %    dZ0=dMz+dMk*tm;  
    
    tn=((dMy-dNy)*dMi+dMj*(dNx-dMx))/(dNj*dMi-dMj*dNi);  
    dX0=dNx+dNi*tn;   
    dY0=dNy+dNj*tn;   
    dZ0=dNz+dNk*tn;  
    
  % Բ������  
    p=[dX0 dY0 dZ0];
    
    

