%the coefficient function of P(i,j)

function output=coeff3(q,r,P,H,R,dhdq,dhdr,bn,i,j)
    
h=H(i,j);
    output=4*r^2*h^3*P(i,j)/R^2+2*r^2*h^3*P(i+1,j)/R^2-2*r^2*h^3*P(i-1,j)/R^2+6*q*r^2*h^2*dhdq*P(i,j)/R^2 ...
   -2*q*r^2*bn*h;
end