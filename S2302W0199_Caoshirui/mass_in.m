%求经过小孔的流量
for Oi=1:length(O_Nposition)
        for Oj=1:length(O_Mposition)
            k=1.4;
            Pg=All_Pg(Oi,Oj);
            if (Pg/Ps)<=(2/(k+1))^(k/(k-1))
                fai=(k/2*(2/(k+1))^((k+1)/(k-1)))^(1/2);
            end
            if (Pg/Ps)>(2/(k+1))^(k/(k-1))
                fai=(k/(k-1)*((Pg/Ps)^(2/k)-(Pg/Ps)^((k+1)/k)))^(1/2);
            end
            massin(Oi,Oj)=pi*(d/10^3)^2/4*(Ps*pa*10^6)*Cd*fai*(2*roa/(pa*10^6))^(1/2);
        end
    end