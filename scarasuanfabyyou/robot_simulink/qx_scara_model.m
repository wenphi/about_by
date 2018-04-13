function scara=qx_scara_model()
L(1)=Link([0 0 250 0 0]);
L(2)=Link([0 0 150 0 0]);
L(3)=Link([0 0 0 0 1]);
L(4)=Link([0 0 0 0 0]);
% scara=L;
scara=SerialLink(L,'name','qx_scara');
end