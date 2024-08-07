%the coefficient function of P(i,j)

function output=coeff02(q,r,P,H,R,dhdq,dhdr,bn,i,j,N)

    h=H(i,j);
    output=4*r^2*h^3*P(1+1,j)/R^2+4*r^2*h^3*P(N-1,j)/R^2-16*r^2*h^3*P(i,j)/R^2 ...
    +4*q^2*h^3*P(i,j+1)+4*q^2*h^3*P(i,j-1)-16*q^2*h^3*P(i,j)+6*r^2*q*h^2*dhdq*P(1+1,j)/R^2 ...
    -6*r^2*q*h^2*dhdq*P(N-1,j)/R^2+6*q^2*r*h^2*dhdr*P(i,j+1)-6*q^2*r*h^2*dhdr*P(i,j-1)...
    +2*q^2*r*h^3*P(i,j+1)/R-2*q^2*r*h^3*P(i,j-1)/R-4*q^2*r^2*bn*dhdq;
    
end