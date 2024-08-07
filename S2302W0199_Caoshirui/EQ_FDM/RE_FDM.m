%求解雷诺方程

%调用子函数计算dh/dq和dh/dr
DHDR=DHDR_eq(H,N,M,q,r); 
DHDQ=DHDQ_eq(H,N,M,q,r); 
 
%线性化无量纲雷诺方程求解

A=zeros(N,M,N,M);  
B=zeros(N,M);
Afinal=zeros(N*M,N*M);

% 求解雷诺方程
for i=1:1:N
    for j=2:1:M-1
        dhdq=DHDQ(i,j);  
        dhdr=DHDR(i,j);
        R=Ri/Ro+r*(j-1);
        if (i>1)&&(i<N)
            A(i-1,j,i,j)=coeff1(q,r,P,H,R,dhdq,dhdr,bn,i,j);
            A(i,j,i,j)=coeff2(q,r,P,H,R,dhdq,dhdr,bn,i,j);
            A(i+1,j,i,j)=coeff3(q,r,P,H,R,dhdq,dhdr,bn,i,j);
            A(i,j-1,i,j)=coeff4(q,r,P,H,R,dhdq,dhdr,bn,i,j);
            A(i,j+1,i,j)=coeff5(q,r,P,H,R,dhdq,dhdr,bn,i,j);
            B(i,j)=right(q,r,P,H,R,dhdq,dhdr,bn,i,j);
        end
        
        if (i==1)||(i==N)
            A(N-1,j,i,j)=coeff01(q,r,P,H,R,dhdq,dhdr,bn,i,j,N);
            A(i,j,i,j)=coeff02(q,r,P,H,R,dhdq,dhdr,bn,i,j,N);
            A(2,j,i,j)=coeff03(q,r,P,H,R,dhdq,dhdr,bn,i,j,N);
            A(i,j-1,i,j)=coeff04(q,r,P,H,R,dhdq,dhdr,bn,i,j,N);
            A(i,j+1,i,j)=coeff05(q,r,P,H,R,dhdq,dhdr,bn,i,j,N);
            B(i,j)=right0(q,r,P,H,R,dhdq,dhdr,bn,i,j,N);
        end
    end
end

  
for l=1:1:M
    for m=1:1:N
        Bfinal((l-1)*N+m)=B(m,l);
        for j=1:1:M
            for i=1:1:N
                Afinal((l-1)*N+m,(j-1)*N+i)=A(i,j,m,l);
                %边界
                if(l==M)||(l==1)
                    Afinal((l-1)*N+m,(l-1)*N+m)=1;
                    Bfinal((l-1)*N+m)=1;
                end
            end
        end
    end
end

for Oi=1:length(O_Nposition)
    for Oj=1:length(O_Mposition)
        m=O_Nposition(Oi);
        l=O_Mposition(Oj);
        Afinal((l-1)*N+m,:)=0;
        Afinal((l-1)*N+m,(l-1)*N+m)=100;
        Bfinal((l-1)*N+m)=100*All_Pg(Oi,Oj); %小孔出口的压力
    end
end
%求解
Cfinal=Afinal\Bfinal'; 
%赋值 

for i=1:1:N
    for j=1:1:M
        P(i,j)=Cfinal((j-1)*N+i);
    end
end




   
   
   
   
   
   
   
   
   
   
   
   
   

