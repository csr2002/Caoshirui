%mass conservation
%此处采用了二分法的思想进行编程计算。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for Oi=1:length(O_Nposition)
    for Oj=1:length(O_Mposition)
        i=O_Nposition(Oi);
        j=O_Mposition(Oj);
        if massin(Oi,Oj)-massout(Oi,Oj)>0   %说明Pg小了，要调大。
            %isp('Pg小了，要调大')
            all_a(Oi,Oj)=All_Pg(Oi,Oj);
            All_Pg(Oi,Oj)=(all_a(Oi,Oj)+all_b(Oi,Oj))/2;
        end
        if massin(Oi,Oj)-massout(Oi,Oj)<0   %说明Pg大了，要调小。
            %disp('Pg大了，要调小')
            all_b(Oi,Oj)=All_Pg(Oi,Oj);
            All_Pg(Oi,Oj)=(all_a(Oi,Oj)+all_b(Oi,Oj))/2;
        end
        if (abs(massin(Oi,Oj)-massout(Oi,Oj)==0))||(abs((massin(Oi,Oj)-massout(Oi,Oj))/massout(Oi,Oj))<1/10000)
            All_Pg(Oi,Oj)=All_Pg(Oi,Oj);      %Pg满足要求了，不进行变化。
        end
    end
end
