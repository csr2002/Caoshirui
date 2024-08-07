
%求解压力分布
addpath(genpath(fullfile(cd,'EQ_FDM')));

clear;
clc;
%%%定义一些基本参数
miu=1.79*10^(-11);       %单位为 MPa·s  空气的动力粘度μ=17.9×10^(-6) Pa·s
pa=101.330*10^(-3);      %单位MPa  1个标准大气压=0.10133MPa
roa=1.293;               %密度,单位Kg/m^3
Rgas=287;                %J/KgK
Temp=20+273;             %K
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ps=5*10^5/(pa*10^6); %供气压力, 无量纲
Ro=25;                   %轴外半径, mm
Ri=5;                    %轴内半径, mm
d=0.10;                %小孔直径, 单位：mm
h0=0.005;                %轴承膜厚，毫米
Cd=0.8;                  %小孔系数
w=0;                     %转速，单位rad/s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Npoint=10;     
Lb=15;       
N=61;        
M=51;        
q=(2*pi)/(N-1);      
r=(Ro-Ri)/Ro/(M-1);  
O_Nposition=3:(N-1)/Npoint:N;
O_Mposition=floor((Lb-Ri)/(Ro-Ri)*M);

%定义初始值
H=ones(N,M);
P=ones(N,M)*1.2;
bn=0;                    %bearing number。转速为零，故bn为0.直接定义为0.
Pold=ones(N,M);          %判断收敛用。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
all_a=1*ones(length(O_Nposition),length(O_Mposition));      %采用二分法来进行迭代计算小孔出口压力
all_b=Ps*ones(length(O_Nposition),length(O_Mposition));     %纯静压轴承的小孔出口压力值必然处于大气压与供气压力之间
all_c=(all_a+all_b)/2;                                      %采用二分法进行迭代计算小孔出口压力
All_Pg=all_c;

oo=0;
while 1
    
    o=0; %定义循环次数初始值为0
    while 1 
        RE_FDM;
        if abs(sum(sum((P-Pold)./P)))<1/10000
            break;
        end
        Pold=P;
        o=o+1;   % 计算求解次数
    end
    
    %基于小孔节流公式，求进入轴承空气质量

    mass_in 

    %求小孔流出的流量
    mass_out
    %%%%%%%%%%%%%
    oo=oo+1      %计算达到质量守恒需要迭代的次数。
    All_All_Pg(:,:,oo)=All_Pg;
    All_massin(:,:,oo)=massin;
    All_massout(:,:,oo)=massout;
    %质量流量平衡判断

    mass_conservation

    %%%%%%%%%%%%%%%%%%%%%%%%
    if max(max(abs((massin-massout)./massout)))<1/100000
        break
    end    
end

%绘图
figure(1)
mesh((P*pa*10^6)');
figure(2)
i=Ri/Ro+(r)*(0:M-1);
j=(q)*(0:N-1);
i=i';
x=i*sin(j);
y=i*cos(j);
surf(x,y,(P*pa*10^6)')
