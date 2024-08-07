%the coefficient function of P(i,j)

function output=coeff2(q,r,P,H,R,dhdq,dhdr,bn,i,j)
% q--angular difference ����q��
% r--radial difference  ����r��
% R--R0/Ro ��(i-1,j)�뾶r����Բ�뾶Ro��outer radius ��֮��(�����ٻ�������Ri/Ro��1֮��)
% Ro--outer radius of sector, Ri--inner radius of sector
% P--pressure
% H--film thickness
% dhdq--dh/dq
% dhdr--dh/dR Ĥ���ؾ�����仯��
% bn --- the bearing number
% i,j--the position of the node in P
    h=H(i,j);
    output=4*r^2*h^3*P(i+1,j)/R^2+4*r^2*h^3*P(i-1,j)/R^2-16*r^2*h^3*P(i,j)/R^2 ...
    +4*q^2*h^3*P(i,j+1)+4*q^2*h^3*P(i,j-1)-16*q^2*h^3*P(i,j)+6*r^2*q*h^2*dhdq*P(i+1,j)/R^2 ...
    -6*r^2*q*h^2*dhdq*P(i-1,j)/R^2+6*q^2*r*h^2*dhdr*P(i,j+1)-6*q^2*r*h^2*dhdr*P(i,j-1)...
    +2*q^2*r*h^3*P(i,j+1)/R-2*q^2*r*h^3*P(i,j-1)/R-4*q^2*r^2*bn*dhdq;
    
end