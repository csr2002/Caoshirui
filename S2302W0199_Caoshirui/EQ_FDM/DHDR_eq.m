%this file is to calculate the dhdr
function output=DHDR_eq(H,N,M,q,r)  

 for j=2:1:M-1
        for i=1:1:N
            DHDQ_temp(i,j)=(H(i,j+1)-H(i,j-1))/(2*r);
        end
 end
    
% 第1列和最后1列
    for i=1:1:N 
        DHDQ_temp(i,1)=(4*H(i,2)-H(i,3)-3*H(i,1))/(2*r);  
        DHDQ_temp(i,M)=-(4*H(i,M-1)-H(i,M-2)-3*H(i,M))/(2*r);
    end
    output=DHDQ_temp;
end

