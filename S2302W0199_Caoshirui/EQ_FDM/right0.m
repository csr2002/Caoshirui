%the function of right side

function output=right0(q,r,P,H,R,dhdq,dhdr,bn,i,j,N)

    output=-reynolds0(q,r,P,H,R,dhdq,dhdr,bn,i,j,N)+coeff01(q,r,P,H,R,dhdq,dhdr,bn,i,j,N)*P(N-1,j)+coeff02(q,r,P,H,R,dhdq,dhdr,bn,i,j,N)*P(i,j)...
           +coeff03(q,r,P,H,R,dhdq,dhdr,bn,i,j,N)*P(1+1,j)+coeff04(q,r,P,H,R,dhdq,dhdr,bn,i,j,N)*P(i,j-1)+coeff05(q,r,P,H,R,dhdq,dhdr,bn,i,j,N)*P(i,j+1);
end
