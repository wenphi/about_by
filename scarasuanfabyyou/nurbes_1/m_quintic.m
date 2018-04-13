% m_quintic(0,0,0,1,0,0,3,0.05);
function p = m_quintic(th0,dth0,ddth0,thtf,dthtf,ddthtf,tf,dt)
% thtf = th0+((dth0 + dthtf) * sqrt(abs(dthtf-dth0) / 10));
C = linspace(0,0,6);
C(1) = th0;
C(2) = dth0;
C(3) = ddth0/2;
C(4) = (20*(thtf-th0)-(8*dthtf+12*dth0)*tf-(3*ddth0-ddthtf)*tf^2)/(2*tf^3);
C(5) = (30*(th0-thtf)+(14*dthtf+16*dth0)*tf+(3*ddth0-2*ddthtf)*tf^2)/(2*tf^4);
C(6) = (12*(thtf-th0)-(6*dthtf+6*dth0)*tf-(ddth0-ddthtf)*tf^2)/(2*tf^5);
ArrayT = 0:dt:tf;
for i=1:1:length(ArrayT);
    t = ArrayT(i);
    th(i) = C(6)*t^5+C(5)*t^4+C(4)*t^3+C(3)*t^2+C(2)*t+C(1);
end
dth = diff(th)*(1/dt);
ddth = diff(dth)*((1/dt)^2);
p = th;
plot(th);
grid on;
figure;
plot(dth);
grid on;
figure;
plot(ddth);
grid on;
end







