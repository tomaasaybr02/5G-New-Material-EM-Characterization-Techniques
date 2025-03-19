%% PROCESADO SALVA:

clear all; 
close all;
clc;

mm=1e-3;
c = physconst('lightspeed');
GHz=1e9;
current_path = pwd;

%MEDIDAS = [current_path '\SEPTIEMBRE_INTA_2023\75_110_GHz_SinLentes_Solape\'];
MEDIDAS = [current_path '/Medidas_Materiales_Abril2024/Banda 33-50 GHz/'];

line=sparameters(strcat(MEDIDAS,'Aire_33_50_GHz.s2p')); % Medida espacio libre
reflect=sparameters(strcat(MEDIDAS,'Metal3mm_33_50_GHz.s2p')); % Medida plano metálico
mut=sparameters(strcat(MEDIDAS,'Metacrilato_33_50_GHz.s2p')); % Medida material
nombre = 'Metacrilato 2.90mm';
d=3*mm; % Grosor del plano metálico (siempre debe ser igual o mayor que el material)
sample=2.90*mm;  % Grosor del material 


Lair=d;

rfplot(mut);    % PARA VER PAR�METROS DEL ANALIZADOR

muestracal=grl_cal(line,reflect,mut,d,d); % Calibración GRL 
airecal=grl_cal(line,reflect,line,d,d); % Calibración GRL 

mf=1;
order = 1;
framelen = 51;

s=muestracal;
freq=s.Frequencies(1:end);
Spar_sample(:,1)=reshape(s.Parameters(1,1,1:end),[length(freq(1:end)),1]);
Spar_sample(:,3)=reshape(s.Parameters(1,2,1:end),[length(freq(1:end)),1]);
Spar_sample(:,2)=reshape(s.Parameters(2,1,1:end),[length(freq(1:end)),1]);
Spar_sample(:,4)=reshape(s.Parameters(2,2,1:end),[length(freq(1:end)),1]);
L=sample;

s=airecal;
freq=s.Frequencies(1:end);
Spar_air(:,1)=reshape(s.Parameters(1,1,1:end),[length(freq(1:end)),1]);
Spar_air(:,3)=reshape(s.Parameters(1,2,1:end),[length(freq(1:end)),1]);
Spar_air(:,2)=reshape(s.Parameters(2,1,1:end),[length(freq(1:end)),1]);
Spar_air(:,4)=reshape(s.Parameters(2,2,1:end),[length(freq(1:end)),1]);

representacion_Spar_Frec(freq, Spar_sample, -70, 0, 'S parameters after GRL')

% APLICA EL TIME GATING
Dmin = 0; 
Dmax = 1000;     %Distancia de la ifft [mm]
DBmin = -100;
DBmax = 0;      %Amplitud [dB]
Pmin = -200;
Pmax = 200;     %Phase [º]

time_gatting=1;   % Poner a 1 si queremos time_gatting
variable_FFT=0;   % poner a 1 para representar los pasos de la IFFT

if time_gatting==1
    
    
    N_hann_air= 100;    % Tama�o de ventana total en muestras = N_hann_air + 1

    [Spar_tiempo_sample, delta_d, d, relleno,Dmax_sample] = IFFT(c,freq, Spar_sample, Dmin, 'SAMPLE' ,variable_FFT);
    [Spar_final_sample] = TIME_GATING(delta_d, d,freq,Spar_sample, N_hann_air, Spar_tiempo_sample, relleno, DBmin, DBmax, Pmin, Pmax, Dmin, Dmax_sample, 'SAMPLE');

    [Spar_tiempo_aire, delta_d, d, relleno,Dmax_sample] = IFFT(c,freq, Spar_air, Dmin, 'Air' ,variable_FFT);
    [Spar_final_air] = TIME_GATING(delta_d, d,freq,Spar_air, N_hann_air, Spar_tiempo_aire, relleno, DBmin, DBmax, Pmin, Pmax, Dmin, Dmax_sample, 'AIR');

else 
    
    Spar_final_sample = Spar_sample;
    Spar_final_air = Spar_air;

end

representacion_Spar_Frec(freq, Spar_final_sample, -70, 0, 'S parameters after GRL and TRL')


for NN=1
    [n,permeabillity,permittivity] = NRW_BJ_TEM_medio(Spar_final_sample,Spar_final_air,freq,c,L,Lair,NN,'aire');

    n=sgolayfilt(n,order,framelen); % This MATLAB function applies a Savitzky-Golay finite impulse response
                                    %(FIR) smoothing filter of polynomial order order and frame length
                                    %framelen to the data in vector x.

    ep_real = medfilt1(sgolayfilt(real(permittivity),order,framelen),mf);
    ep_imag = medfilt1(sgolayfilt(imag(permittivity),order,framelen),mf);
    mu_real = medfilt1(sgolayfilt(real(permeabillity),order,framelen),mf);
    mu_imag = medfilt1(sgolayfilt(imag(permeabillity),order,framelen),mf);
    n2 = medfilt1(abs(n).^2,mf);

    amp_max = 5;
    amp_min = 0;

    representacion_mu_epsilon(NN,freq,ep_real,ep_imag,mu_real,mu_imag,n2,amp_max,amp_min,nombre)
                        

end



%{
    fig = figure();
    subplot(3,1,2);   
    plot(freq/GHz,medfilt1(sgolayfilt(real(permittivity),order,framelen),mf),freq/GHz,medfilt1(sgolayfilt(imag(permittivity),order,framelen),mf),'LineWidth',2);
    ylim([0 5])
    lgd = legend('Real', 'Imaginaria')
    lgd.FontSize = 14;
    lgd.FontName = 'Times New Roman'
    xlabel('Frecuencia [GHz]','Interpreter','latex','FontSize',14)
    ylabel('\epsilon_r','FontSize',14)
    ejes = gca;
    ejes.FontName = 'Times New Roman'
    ejes.FontSize = 14;
    %ylabel('\epsilon_r','Interpreter','latex')
    grid
    subplot(3,1,3);
    plot(freq/GHz,medfilt1(sgolayfilt(real(permeabillity),order,framelen),mf),freq/GHz,medfilt1(sgolayfilt(imag(permeabillity),order,framelen),mf),'LineWidth',2);
    ylim([0 5])
    lgd = legend('Real', 'Imaginaria')
    lgd.FontSize = 14;
    lgd.FontName = 'Times New Roman'
    xlabel('Frecuencia [GHz]','Interpreter','latex','FontSize',14)
    ylabel('\mu_r','FontSize',14)
    %ylabel('\mu_r','Interpreter','latex')
    ejes = gca;
    ejes.FontName = 'Times New Roman';
    ejes.FontSize = 14;
    grid
    subplot(3,1,1);
    plot(freq/GHz,medfilt1(abs(n).^2,mf),'LineWidth',2);
    ylim([0 5])
    %xlim([30 52])
    xlabel('Frecuencia [GHz]','Interpreter','latex','FontSize',14)
    ylabel('n^2','FontSize',14)
    %ylabel('n^2','Interpreter','latex')
    ejes = gca;
    ejes.FontName = 'Times New Roman'
    ejes.FontSize = 14;
    grid
    sgtitle(sprintf('NN =  %d', NN),'FontName','Times New Roman','FontWeight','bold','FontSize',14)
%}