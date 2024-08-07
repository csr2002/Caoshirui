%this file is to calculate the dhdq
function output=DHDQ_eq(H,N,M,q,r)  
 for i=2:1:N-1
        for j=1:1:M
            DHDQ_temp(i,j)=(H(i+1,j)-H(i-1,j))/(2*q);
        end
 end
    
%第1行和最后1行
    for j=1:1:M
        DHDQ_temp(1,j)=(4*H(2,j)-H(3,j)-3*H(1,j))/(2*q);  
        DHDQ_temp(N,j)=-(4*H(N-1,j)-H(N-2,j)-3*H(N,j))/(2*q);
    end
    output=DHDQ_temp;
end
