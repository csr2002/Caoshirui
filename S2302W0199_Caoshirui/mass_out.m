%微元法求小孔流出的流量
DPDR=DHDR_eq(P,N,M,q,r);
DPDQ=DHDQ_eq(P,N,M,q,r);
masscoeff=-1*(h0/10^3)^3*(pa*10^6)^2/(12*miu*10^6*Rgas*Temp);
for Oi=1:length(O_Nposition)
    for Oj=1:length(O_Mposition)
        i=O_Nposition(Oi);
        j=O_Mposition(Oj);
        R=Ri/Ro+r*(j-1);
        massRl(Oi,Oj)=masscoeff*H(i,j-1)^3*(P(i,j-1)+P(i,j))/2*(P(i,j)-P(i,j-1))/r*(R-r/2)*q*(-1);
        massRr(Oi,Oj)=masscoeff*H(i,j+1)^3*(P(i,j+1)+P(i,j))/2*(P(i,j)-P(i,j+1))/r*(R+r/2)*q*(-1);
        massQu(Oi,Oj)=masscoeff*H(i-1,j)^3*(P(i-1,j)+P(i,j))/2*(P(i,j)-P(i-1,j))/q/R*r*(-1);
        massQd(Oi,Oj)=masscoeff*H(i+1,j)^3*(P(i+1,j)+P(i,j))/2*(P(i,j)-P(i+1,j))/q/R*r*(-1);
    end
end
massout=massRl+massRr+massQu+massQd;  %从节流孔流出的总流量
