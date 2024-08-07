%the coefficient function of P(i-1,j)

function output=coeff01(q,r,P,H,R,dhdq,dhdr,bn,i,j,N)

    h=H(i,j);
    output=4*r^2*h^3*P(i,j)/R^2-2*r^2*h^3*P(1+1,j)/R^2 +2*r^2*h^3*P(N-1,j)/R^2-6*q*r^2*dhdq*h^2*P(i,j)/R^2+2*q*r^2*bn*h;
end

