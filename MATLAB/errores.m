%% MAIN obtención de los parámetros de un material.
% Se va a llevar a cabo a través de la función 'NRW_BJ_TEM_2.m'

% El primer paso será cargar los datos procedentes de la simulación
% realizada en CST.
close all
%clear all
clc

% mm=1e-3;
% z_ang = zeros(1001,6);
% ep_ang = zeros(1001,6);
% mu_ang = zeros(1001,6);
% n_ang = zeros(1001,6);
% s_ang = zeros(1001,6);
% % s_ang = zeros(1,5);

S_muestra = sparameters('../CST/Simulaciones/Análisis Z/MUT_2cm_des_PEC_05.s2p');
%S_muestra = sparameters('../CST/Simulaciones/Análisis Z/MUT_2cm_X_0.s2p');
S1 = S_muestra.Parameters;
freq = S_muestra.Frequencies;  
S_aire = sparameters('../CST/Simulaciones/Análisis Z/aire_2cm_des_PEC_05.s2p');
%S_aire = sparameters('../CST/Simulaciones/Análisis Z/aire_2cm.s2p');
S2 = S_aire.Parameters;

Spar_sample = zeros(length(freq), 4);

for i = 1:length(freq)
    Spar_sample(i, 1) = S1(1, 1, i);
    Spar_sample(i, 3) = S1(2, 1, i);
    Spar_sample(i, 2) = S1(1, 2, i);
    Spar_sample(i, 4) = S1(2, 2, i);
end

Spar_air = zeros(length(freq), 4);

for i = 1:length(freq)
    Spar_air(i, 1) = S2(1, 1, i);
    Spar_air(i, 3) = S2(2, 1, i);
    Spar_air(i, 2) = S2(1, 2, i);
    Spar_air(i, 4) = S2(2, 2, i);
end

Lair = 2*mm;
L = 2*mm;
c = 3e8;
NN = [1];


[n,mu,E,Z,SZ_Lair] = NRW_BJ_TEM_3(Spar_sample,Spar_air,freq,c,L,Lair,NN);

% Obtener las partes real e imaginaria de n^2, mu_r y E_r
n_real = real(n.^2);
n_imag = imag(n.^2);

mu_real = real(mu);
%mu_real = medfilt1(mu_real);
mu_imag = imag(mu);

E_real = real(E);
E_real = medfilt1(E_real);
E_imag = imag(E);

%{
figure(2)
% Parte Real de n^2
subplot(3,2,1);
plot(freq, n_real);
title('Parte Real de n^2');
xlabel('Frecuencia (Hz)');
ylabel('Valor');
legend('NN = 0','NN = 1','NN = 2')%,'NN = 3','NN = 4','NN = 5')
grid on
% Parte Imaginaria de n^2
subplot(3,2,2);
plot(freq, n_imag);
title('Parte Imaginaria de n^2');
xlabel('Frecuencia (Hz)');
ylabel('Valor');
legend('NN = 0','NN = 1','NN = 2')%,'NN = 3','NN = 4','NN = 5')
grid on
% Parte Real de mu_r
subplot(3,2,3);
plot(freq, mu_real);
title('Parte Real de \mu_r');
xlabel('Frecuencia (Hz)');
ylabel('Valor');
legend('NN = 0','NN = 1','NN = 2')%,'NN = 3','NN = 4','NN = 5')
grid on
% Parte Imaginaria de mu_r
subplot(3,2,4);
plot(freq, mu_imag);
title('Parte Imaginaria de \mu_r');
xlabel('Frecuencia (Hz)');
ylabel('Valor');
legend('NN = 0','NN = 1','NN = 2')%,'NN = 3','NN = 4','NN = 5')
grid on
% Parte Real de E_r
subplot(3,2,5);
plot(freq, E_real);
title('Parte Real de \epsilon_r');
xlabel('Frecuencia (Hz)');
ylabel('Valor');
legend('NN = 0','NN = 1','NN = 2')%,'NN = 3','NN = 4','NN = 5')
grid on
% Parte Imaginaria de E_r
subplot(3,2,6);
plot(freq, E_imag);
title('Parte Imaginaria de \epsilon_r');
xlabel('Frecuencia (Hz)');
ylabel('Valor');
grid on
legend('NN = 0','NN = 1','NN = 2')%,'NN = 3','NN = 4','NN = 5')
% Ajustar la disposición de las subgráficas
sgtitle('Representación de los parámetros n^2 \epsilon_r, \mu_r');
%}

n_ang(:,6) = n_real;
z_ang(:,6) = Z;
ep_ang(:,6) = E_real;
mu_ang(:,6) = mu_real;
s_ang(:,6) = SZ_Lair;

%% GRÁFICAS MEMORIA:

% colors = [
%     0.1, 0.3, 0.5; % Azul oscuro
%     0.2, 0.4, 0.6;
%     0.3, 0.5, 0.7; 
%     0.4, 0.6, 0.8;
%     0.5, 0.7, 0.9;
%     0.6, 0.8, 1.0  % Azul claro
% ];

nombre = 'Errores angulares';

figure('Name', nombre + ", propiedades electromagnéticas",'Position', [0, 0, 850, 300])   
 hold on;
for k = 1:6
     plot(freq*1e-9, real(n_ang(:, k)), 'LineWidth', 2);
end
hold off;
ylim([1.5 2.5])
% xlim([freq(1) freq(end)])
lgd = legend('0 mm', '0.1 mm', '0.2 mm', '0.3 mm', '0.4 mm', '0.5 mm')
%lgd = legend('0 mm', '-0.1 mm', '-0.2 mm', '-0.3 mm', '-0.4 mm', '-0.5 mm')
%lgd = legend('0 mm', '0.5 mm', '0.75 mm', '1 mm', '1.25 mm', '1.5 mm')
%lgd = legend('0 mm', '-0.1 mm', '-0.15 mm', '-0.2 mm', '-0.25 mm', '-0.3 mm')
%lgd = legend('0º', '1º', '2º', '3º', '4º', '5º')
lgd.FontSize = 18;
lgd.FontName = 'Times New Roman'
xlabel('Frecuencia [GHz]','Interpreter','latex','FontSize',14)
ylabel('n^2','FontSize',14)
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 18;
grid

nombre = 'Errores \epsilon_r';
% colors = [
%     0.5, 0.1, 0.1; % Rojo oscuro
%     0.6, 0.2, 0.2;
%     0.7, 0.3, 0.3; 
%     0.8, 0.4, 0.4;
%     0.9, 0.5, 0.5;
%     1.0, 0.6, 0.6  % Rojo claro
% ];
figure('Name', nombre + ", propiedades electromagnéticas",'Position', [0, 0, 850, 300])   
hold on;
for k = 1:6
    plot(freq*1e-9, real(ep_ang(:, k)), 'LineWidth', 2);
end
hold off;
ylim([1.5 2.5])
% xlim([freq(1) freq(end)])
lgd = legend('0 mm', '0.1 mm', '0.2 mm', '0.3 mm', '0.4 mm', '0.5 mm')
%lgd = legend('0 mm', '-0.1 mm', '-0.2 mm', '-0.3 mm', '-0.4 mm', '-0.5 mm')
%lgd = legend('0 mm', '0.5 mm', '0.75 mm', '1 mm', '1.25 mm', '1.5 mm')
%lgd = legend('0 mm', '-0.1 mm', '-0.15 mm', '-0.2 mm', '-0.25 mm', '-0.3 mm')
%lgd = legend('0º', '1º', '2º', '3º', '4º', '5º')
lgd.FontSize = 18;
lgd.FontName = 'Times New Roman'
xlabel('Frecuencia [GHz]','Interpreter','latex','FontSize',14)
ylabel('\epsilon_r','FontSize',14)
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 18;
grid

nombre = 'Errores \mu_r';
% colors = [
%     0.1, 0.5, 0.1; % Verde oscuro
%     0.2, 0.6, 0.2;
%     0.3, 0.7, 0.3; 
%     0.4, 0.8, 0.4;
%     0.5, 0.9, 0.5;
%     0.6, 1.0, 0.6  % Verde claro
% ];
figure('Name', nombre + ", propiedades electromagnéticas",'Position', [0, 0, 850, 300])   
hold on;
for k = 1:6
    plot(freq*1e-9, real(mu_ang(:, k)), 'LineWidth', 2);
end
hold off;
ylim([0.5 1.5])
% xlim([freq(1) freq(end)])
lgd = legend('0 mm', '0.1 mm', '0.2 mm', '0.3 mm', '0.4 mm', '0.5 mm')
%lgd = legend('0 mm', '-0.1 mm', '-0.2 mm', '-0.3 mm', '-0.4 mm', '-0.5 mm')
%lgd = legend('0 mm', '0.5 mm', '0.75 mm', '1 mm', '1.25 mm', '1.5 mm')
%lgd = legend('0 mm', '-0.1 mm', '-0.15 mm', '-0.2 mm', '-0.25 mm', '-0.3 mm')
%lgd = legend('0º', '1º', '2º', '3º', '4º', '5º')
lgd.FontSize = 18;
lgd.FontName = 'Times New Roman'
xlabel('Frecuencia [GHz]','Interpreter','latex','FontSize',14)
ylabel('\mu_r','FontSize',14)
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 18;
grid

% colors = [
%     0.2, 0.0, 0.2; % Morado oscuro
%     0.4, 0.0, 0.4;
%     0.6, 0.0, 0.6; 
%     0.7, 0.1, 0.7;
%     0.8, 0.2, 0.8;
%     0.9, 0.3, 0.9  % Morado claro
% ];

nombre = 'Impedancia Z'
figure('Name', nombre + ", propiedades electromagnéticas",'Position', [0, 0, 850, 300])   
hold on;
for k = 1:6
    plot(freq*1e-9, real(z_ang(:, k)), 'LineWidth', 2);
end
hold off;
ylim([0 1])
% xlim([freq(1) freq(end)])
%lgd = legend('0 mm', '0.1 mm', '0.2 mm', '0.3 mm', '0.4 mm', '0.5 mm')
%lgd = legend('0 mm', '-0.1 mm', '-0.2 mm', '-0.3 mm', '-0.4 mm', '-0.5 mm')
%lgd = legend('0 mm', '0.5 mm', '0.75 mm', '1 mm', '1.25 mm', '1.5 mm')
lgd = legend('0 mm', '-0.1 mm', '-0.15 mm', '-0.2 mm', '-0.25 mm', '-0.3 mm')
%lgd = legend('0º', '1º', '2º', '3º', '4º', '5º')
lgd.FontSize = 18;
lgd.FontName = 'Times New Roman'
xlabel('Frecuencia [GHz]','Interpreter','latex','FontSize',14)
ylabel('Impedancia intrínseca Z','FontSize',14)
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 18;
grid

% colors = [
%     0.6, 0.2, 0.0; % Naranja oscuro
%     0.7, 0.3, 0.0;
%     0.8, 0.4, 0.0;
%     0.9, 0.5, 0.0;
%     1.0, 0.6, 0.0;
%     1.0, 0.7, 0.1  % Naranja claro
% ];

nombre = 'Sensibilidad'
figure('Name', nombre + ", propiedades electromagnéticas",'Position', [0, 0, 850, 500])   
hold on;
for k = 1:6
    plot(freq*1e-9, real(s_ang(:, k)), 'LineWidth', 2);
end
hold off;
ylim([0 14])
% xlim([freq(1) freq(end)])
%lgd = legend('0 mm', '0.1 mm', '0.2 mm', '0.3 mm', '0.4 mm', '0.5 mm')
%lgd = legend('0mm', '0.5mm', '0.75mm', '1mm', '1.25mm', '1.5mm')
lgd = legend('0 mm', '0.1 mm', '0.15 mm', '0.2 mm', '0.25 mm', '0.3 mm')
%lgd = legend('0º', '1º', '2º', '3º', '4º', '5º')
lgd.FontSize = 18;
lgd.FontName = 'Times New Roman'
xlabel('Frecuencia [GHz]','Interpreter','latex','FontSize',14)
ylabel('\delta Z','FontSize',14)
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 18;
grid


% figure(1)
% subplot(1,2,1)
% plot(freq, real(z_ang),'LineWidth', 1);
% title('Impedancia relativa en función de la frecuencia.');
% xlabel('Frecuencia (Hz)');
% ylabel('Z');
% legend('0mm','0.1mm','0.2mm','0.3mm','0.4mm','0.5mm')
% grid on

% %norm_S = s_ang./(max(max(s_ang)));
% subplot(1,2,2)
% plot(freq,s_ang)
% title('Sensibilidad respecto L_{air} en función de la frecuencia.');
% xlabel('Frecuencia (Hz)');
% ylabel('\delta Z');
% legend('0mm','0.1mm','0.2mm','0.3mm','0.4mm','0.5mm')
% grid on

%{
figure(4)
sgtitle('Estudio del desalineamiento en los puertos.')
subplot(2,3,1)
hold on
plot(freq, n_real)
%plot(freq, n_ang(2))
title('Parte real de n^2.')
xlabel('Frecuencia (Hz)');
ylabel('Valor');
%legend('1','2');
grid on
subplot(2,3,2)
hold on
plot(freq, real(Z))
%plot(freq, real(z_ang(2)))
title('Parte real de la Impedancia Z.')
xlabel('Frecuencia (Hz)');
ylabel('Valor');
grid on
subplot(2,3,3)
hold on
plot(freq, E_real)
%plot(freq, ep_ang(2))
plot(freq, mu_real)
%plot(freq, mu_ang(2))
title('Parte real de \epsilon_r y \mu_r.')
xlabel('Frecuencia (Hz)');
ylabel('Valor');
legend('\epsilon_r', '\mu_r')
grid on
subplot(2,3,4)
hold on
rfplot(S_muestra,{[2 2]; [2 1]});
%rfplot(S_muestra_2,{[2 2]; [2 1]});
title('Magnitud parámetros S_{21} y S_{22}.')
xlabel('Frecuencia (Hz)');
grid on
subplot(2,3,5)
hold on
rfplot(S_muestra,{[2 2]; [2 1]},"angle");
%rfplot(S_muestra_2,{[2 2]; [2 1]},"angle");
title('Fase parámetros S_{21} y S_{22}.')
xlabel('Frecuencia (Hz)');
grid on
%}

%% ANÁLISIS DE LA IMPEDANCIA INTRÍNSECA:

%{
figure(3)
hold on
plot(freq, real(z_ang))%,'LineWidth', 2);
title('Impedancia relativa en función del ángulo X de incidencia en el dominio de la frecuencia.');
xlabel('Frecuencia (Hz)');
ylabel('Z');
legend('X = 0º','X = 0.25º', 'X = 0.5º', 'X = 0.75º', 'X = 1º', 'X = 1.25º', 'X = 1.5º', 'X = 1.75º', 'X = 2º')
%legend('X = 0º', 'X = 0.75º', 'X = 1º', 'X = 1.25º')
grid on
%}

a=sparameters('../simulaciones_CST/s2p_2024/Análisis Z/MUT_2cm_Lair_0mm.s2p');
b=sparameters('../simulaciones_CST/s2p_2024/Análisis Z/MUT_2cm_Lair_01mm.s2p');
c=sparameters('../simulaciones_CST/s2p_2024/Análisis Z/MUT_2cm_Lair_02mm.s2p');
de=sparameters('../simulaciones_CST/s2p_2024/Análisis Z/MUT_2cm_Lair_03mm.s2p');
efe=sparameters('../simulaciones_CST/s2p_2024/Análisis Z/MUT_2cm_Lair_04mm.s2p');
g=sparameters('../simulaciones_CST/s2p_2024/Análisis Z/MUT_2cm_Lair_05mm.s2p');
% h=sparameters('../simulaciones_CST/s2p_2024/Etapa Deembedding/MUT_rotado_3cm_Y_7.s2p');
% ii=sparameters('../simulaciones_CST/s2p_2024/Etapa Deembedding/MUT_rotado_3cm_Y_8.s2p');
% jota=sparameters('../simulaciones_CST/s2p_2024/Etapa Deembedding/MUT_3cm_des.s2p');
% ka =sparameters('../simulaciones_CST/s2p_2024/Etapa Deembedding/MUT_rotado_3cm_Y_10.s2p');

figure(4)
sgtitle('Parametrización del desalineamiento entre puertos con láminas PEC.')
subplot(2,2,1)
hold on
plot(freq, n_ang)
title('Parte real de n^2.')
xlabel('Frecuencia (Hz)');
ylabel('Valor');
%legend('X = 0º','X = 0.25º', 'X = 0.5º', 'X = 0.75º', 'X = 1º')%, 'X = 1.25º', 'X = 1.5º', 'X = 1.75º', 'X = 2º')
%legend('X = 0º','X = 1.25º', 'X = 1.5º', 'X = 1.75º', 'X = 2º')
legend('0mm','0.1mm','0.2mm','0.3mm','0.4mm','0.5mm')
grid on
% subplot(2,2,2)
% hold on
% plot(freq, z_ang)
% title('Parte real de la Impedancia Z.')
% xlabel('Frecuencia (Hz)');
% ylabel('Valor');
% %legend('X = 0º','X = 0.25º', 'X = 0.5º', 'X = 0.75º', 'X = 1º')%, 'X = 1.25º', 'X = 1.5º', 'X = 1.75º', 'X = 2º')
% %legend('X = 0º','X = 1.25º', 'X = 1.5º', 'X = 1.75º', 'X = 2º')
% legend('0.5mm','1mm')
grid on
subplot(2,2,2)
hold on
plot(freq, ep_ang)
title('Parte real de \epsilon_r.')
xlabel('Frecuencia (Hz)');
ylabel('Valor');
%legend('X = 0º','X = 0.25º', 'X = 0.5º', 'X = 0.75º', 'X = 1º', 'X = 1.25º', 'X = 1.5º', 'X = 1.75º', 'X = 2º')
legend('0mm','0.1mm','0.2mm','0.3mm','0.4mm','0.5mm')
grid on
subplot(2,2,3)
hold on
plot(freq, mu_ang)
title('Parte real de \mu_r.')
xlabel('Frecuencia (Hz)');
ylabel('Valor');
%legend('X = 0º','X = 0.25º', 'X = 0.5º', 'X = 0.75º', 'X = 1º', 'X = 1.25º', 'X = 1.5º', 'X = 1.75º', 'X = 2º')
legend('0mm','0.1mm','0.2mm','0.3mm','0.4mm','0.5mm')
grid on
% subplot(2,3,4)
% hold on
% rfplot(a,{[2 2]; [2 1]});
% % rfplot(b,{[2 2]; [2 1]})
% % rfplot(c,{[2 2]; [2 1]})
% % rfplot(de,{[2 2]; [2 1]})
% % rfplot(efe,{[2 2]; [2 1]})
% % rfplot(g,{[2 2]; [2 1]})
% % rfplot(h,{[2 2]; [2 1]})
% % rfplot(ii,{[2 2]; [2 1]})
% rfplot(jota,{[2 2]; [2 1]})
% %rfplot(ka,{[2 2]; [2 1]})
% title('Magnitud parámetros S_{21} y S_{22}.')
% xlabel('Frecuencia (Hz)');
grid on
subplot(2,2,4)
hold on
rfplot(a,{[2 2]; [2 1]},"angle");
rfplot(b,{[2 2]; [2 1]},"angle")
rfplot(c,{[2 2]; [2 1]},"angle")
rfplot(de,{[2 2]; [2 1]},"angle")
rfplot(efe,{[2 2]; [2 1]},"angle")
rfplot(g,{[2 2]; [2 1]},"angle")
% rfplot(h,{[2 2]; [2 1]},"angle")
% rfplot(ii,{[2 2]; [2 1]},"angle")
%rfplot(jota,{[2 2]; [2 1]},"angle")
%rfplot(ka,{[2 2]; [2 1]},"angle")
title('Fase parámetros S_{21} y S_{22}.')
xlabel('Frecuencia (Hz)');
grid on
