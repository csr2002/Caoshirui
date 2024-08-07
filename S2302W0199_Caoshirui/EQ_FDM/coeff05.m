%the coefficient function of P(i,j)

function output=coeff05(q,r,P,H,R,dhdq,dhdr,bn,i,j,N)

    h=H(i,j);
    output=4*q^2*h^3*P(i,j)+2*q^2*h^3*P(i,j+1)-2*q^2*h^3*P(i,j-1)+6*q^2*r*h^2*dhdr*P(i,j)+2*q^2*r*h^3*P(i,j)/R;
end