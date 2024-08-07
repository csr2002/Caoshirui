
%���ѹ���ֲ�
addpath(genpath(fullfile(cd,'EQ_FDM')));

clear;
clc;
%%%����һЩ��������
miu=1.79*10^(-11);       %��λΪ MPa��s  �����Ķ���ճ�Ȧ�=17.9��10^(-6) Pa��s
pa=101.330*10^(-3);      %��λMPa  1����׼����ѹ=0.10133MPa
roa=1.293;               %�ܶ�,��λKg/m^3
Rgas=287;                %J/KgK
Temp=20+273;             %K
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ps=5*10^5/(pa*10^6); %����ѹ��, ������
Ro=25;                   %����뾶, mm
Ri=5;                    %���ڰ뾶, mm
d=0.10;                %С��ֱ��, ��λ��mm
h0=0.005;                %���Ĥ�񣬺���
Cd=0.8;                  %С��ϵ��
w=0;                     %ת�٣���λrad/s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Npoint=10;     
Lb=15;       
N=61;        
M=51;        
q=(2*pi)/(N-1);      
r=(Ro-Ri)/Ro/(M-1);  
O_Nposition=3:(N-1)/Npoint:N;
O_Mposition=floor((Lb-Ri)/(Ro-Ri)*M);

%�����ʼֵ
H=ones(N,M);
P=ones(N,M)*1.2;
bn=0;                    %bearing number��ת��Ϊ�㣬��bnΪ0.ֱ�Ӷ���Ϊ0.
Pold=ones(N,M);          %�ж������á�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
all_a=1*ones(length(O_Nposition),length(O_Mposition));      %���ö��ַ������е�������С�׳���ѹ��
all_b=Ps*ones(length(O_Nposition),length(O_Mposition));     %����ѹ��е�С�׳���ѹ��ֵ��Ȼ���ڴ���ѹ�빩��ѹ��֮��
all_c=(all_a+all_b)/2;                                      %���ö��ַ����е�������С�׳���ѹ��
All_Pg=all_c;

oo=0;
while 1
    
    o=0; %����ѭ��������ʼֵΪ0
    while 1 
        RE_FDM;
        if abs(sum(sum((P-Pold)./P)))<1/10000
            break;
        end
        Pold=P;
        o=o+1;   % ����������
    end
    
    %����С�׽�����ʽ���������п�������

    mass_in 

    %��С������������
    mass_out
    %%%%%%%%%%%%%
    oo=oo+1      %����ﵽ�����غ���Ҫ�����Ĵ�����
    All_All_Pg(:,:,oo)=All_Pg;
    All_massin(:,:,oo)=massin;
    All_massout(:,:,oo)=massout;
    %��������ƽ���ж�

    mass_conservation

    %%%%%%%%%%%%%%%%%%%%%%%%
    if max(max(abs((massin-massout)./massout)))<1/100000
        break
    end    
end

%��ͼ
figure(1)
mesh((P*pa*10^6)');
figure(2)
i=Ri/Ro+(r)*(0:M-1);
j=(q)*(0:N-1);
i=i';
x=i*sin(j);
y=i*cos(j);
surf(x,y,(P*pa*10^6)')
