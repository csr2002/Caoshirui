%the function of right side

function output=right(q,r,P,H,R,dhdq,dhdr,bn,i,j)
    
    output=-reynolds(q,r,P,H,R,dhdq,dhdr,bn,i,j)+coeff1(q,r,P,H,R,dhdq,dhdr,bn,i,j)*P(i-1,j)+coeff2(q,r,P,H,R,dhdq,dhdr,bn,i,j)*P(i,j)...
           +coeff3(q,r,P,H,R,dhdq,dhdr,bn,i,j)*P(i+1,j)+coeff4(q,r,P,H,R,dhdq,dhdr,bn,i,j)*P(i,j-1)+coeff5(q,r,P,H,R,dhdq,dhdr,bn,i,j)*P(i,j+1);
end
