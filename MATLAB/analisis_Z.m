%% Estudio de los distintos errores de la impedancia relativa Z.

clear all
close all
clc

datos_Z = load('Medidas_Materiales_Abril2024/Z_X.mat');
%datos_Z_aux = load('Medidas_Materiales_Abril2024/Z_Y.mat');
datos_f = load('Medidas_Materiales_Abril2024/freq.mat');

Z1 = datos_Z.z_ang;
%Z_aux = datos_Z_aux.z_ang;
%Z_aux = Z_aux(:,1);
%Z = zeros(1001,6);
%Z = [Z_aux Z1];

freq = datos_f.freq;

% Aplicamos un filtrado de mediana

ventana = 1300; % Tamaño de la ventana de la mediana
for i = 1:6
    Z_suav(:, i) = medfilt1(real(Z1(:, i)), ventana);
end


% colors = [
%     0.2, 0.0, 0.2; % Morado oscuro
%     0.4, 0.0, 0.4;
%     0.6, 0.0, 0.6; 
%     0.7, 0.1, 0.7;
%     0.8, 0.2, 0.8;
%     0.9, 0.3, 0.9  % Morado claro
% ];
nombre = 'Corrección indeterminaciones'

figure('Name', nombre + ", propiedades electromagnéticas",'Position', [0, 0, 850, 300])   
hold on
for k = 1:6
    plot(freq*1e-9, real(Z1(:, k)), 'LineWidth', 2);
end
hold off
ylim([0.5 1])
%xlim([freq(1) freq(end)])
%lgd = legend('0mm', '0.1mm', '0.2mm', '0.3mm', '0.4mm', '0.5mm')
lgd = legend('0º', '1º', '2º', '3º', '4º', '5º')
lgd.FontSize = 18;
lgd.FontName = 'Times New Roman'
xlabel('Frecuencia [GHz]','Interpreter','latex','FontSize',14)
ylabel('Impedancia Intrínseca Z','FontSize',14)
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 18;
grid

%%
nombre = 'Sin Corrección indeterminaciones'

figure('Name', nombre + ", propiedades electromagnéticas",'Position', [0, 0, 850, 500])   
hold on
for k = 1:6
    plot(freq*1e-9, real(Z(:, k)), 'LineWidth', 2, 'Color', colors(k, :));
end
hold off
ylim([0.5 1])
%xlim([freq(1) freq(end)])
lgd = legend('0mm', '0.1mm', '0.2mm', '0.3mm', '0.4mm', '0.5mm')
%lgd = legend('0º', '1º', '2º', '3º', '4º', '5º')
lgd.FontSize = 14;
lgd.FontName = 'Times New Roman'
xlabel('Frecuencia [GHz]','Interpreter','latex','FontSize',14)
ylabel('Impedancia Intrínseca Z','FontSize',14)
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 14;
grid

%{
figure(1)
subplot(2,1,1)
plot(freq, real(Z),'LineWidth', 1);
title('\epsilon_r en función de la frecuencia.');
xlabel('Frecuencia (Hz)');
grid on
ylabel('Z');
%legend('0º','1º','2º','3º','4º','5º')
legend('0mm','0.1mm','0.2mm','0.3mm','0.4mm','0.5mm')
subplot(2,1,2)
plot(freq, real(Z_suav),'LineWidth', 1);
title('\epsilon_r en función de la frecuencia tras el suavizado.');
xlabel('Frecuencia (Hz)');
ylabel('Z');
%legend('0º','1º','2º','3º','4º','5º')
legend('0mm','0.1mm','0.2mm','0.3mm','0.4mm','0.5mm')
grid on
%}

%% REGRESIÓN LINEAL:

% Supongamos que tienes los datos de frecuencia y de impedancia ideal e con errores

% Frecuencia (x) y datos de impedancia ideal (y_ideal)
x = freq(101:901,:);
y_ideal = real(Z_suav(:,1));  % Datos de impedancia ideal
y_ideal = y_ideal(101:901,:)
media_ideal = mean(y_ideal);
desv_ideal = std(y_ideal);
y_ideal_norm = (y_ideal-media_ideal)/desv_ideal;

for i = 1:6
% Datos de impedancia con errores
y_con_errores = real(Z_suav(:,i));  % Datos de impedancia con errores
y_con_errores = y_con_errores(101:901,:);
media_error = mean(y_con_errores);
desv_error= std(y_con_errores);
y_con_errores_norm = (y_con_errores-media_error)/desv_error;

Er(i) = abs(media_ideal-media_error)/abs(media_ideal)*100;
end
%% Gráfica Regresión

% Realiza la regresión lineal entre los dos conjuntos de datos
grado = 1;  % Ajusta una línea recta (grado 1)
coefs = polyfit(y_ideal_norm, y_con_errores_norm, grado);

% Coeficientes obtenidos
pendiente = coefs(1);
intercepto = coefs(2);

% Calcula los valores ajustados
ajuste = polyval(coefs, y_ideal_norm);

% Visualiza los resultados
figure(3);
hold on
plot(x, y_con_errores, 'o')
plot(x, ajuste, '-','LineWidth', 2);
xlabel('Frecuencia(Hz).');
ylabel('Impedancia relativa, Z.');
title('Ajuste entre Impedancia Ideal e Impedancia con Errores');
legend('Datos con Errores', 'Ajuste lineal');
grid on;

% Ejemplo de cálculo de R-cuadrado
y_ajustado = polyval(coefs, y_ideal);
R_cuadrado = 1 - sum((y_con_errores - y_ajustado).^2) / sum((y_con_errores - mean(y_con_errores)).^2);
R_final = R_cuadrado*100;
disp(['Coeficiente de determinación (R^2): ', num2str(R_final), '%']);

%% Gráfica Error relativo
current_path = pwd;
MEDIDAS_1 = [current_path '/Medidas_Materiales_Abril2024/'];

load(strcat(MEDIDAS_1,'Er_X.mat'))
Er_Z_X = E;
load(strcat(MEDIDAS_1,'Er_ep_X.mat'))
Er_ep_X = Er;
load(strcat(MEDIDAS_1,'Er_mu_X.mat'))
Er_mu_X = Er;

x_valores = 1:6;

nombre = 'Error Rotación X'
figure('Name', nombre + ", propiedades electromagnéticas",'Position', [0, 0, 850, 500])   
plot((x_valores-1), Er_Z_X,'-p','LineWidth',2);
hold on
plot((x_valores-1),Er_ep_X,'-o','LineWidth',2);
plot((x_valores-1),Er_mu_X, '-sg','LineWidth',2);
hold off
% ylim([amp_min_ep amp_max_ep])
% xlim([freq(1) freq(end)])
lgd = legend('Impedancia Z', '\epsilon_r', '\mu_r')
lgd.FontSize = 14;
lgd.FontName = 'Times New Roman'
xlabel('Error angular [º]','Interpreter','latex','FontSize',14)
ylabel('Error porcentual [%]','FontSize',14)
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 14;
grid
xticks(0:5)

% Errores en Y:

load(strcat(MEDIDAS_1,'Er_Y.mat'))
Er_Z_Y = E;
load(strcat(MEDIDAS_1,'Er_ep_Y.mat'))
Er_ep_Y = Er;
load(strcat(MEDIDAS_1,'Er_mu_Y.mat'))
Er_mu_Y = Er;

x_valores = 1:6;

nombre = 'Error Rotación Y'
figure('Name', nombre + ", propiedades electromagnéticas",'Position', [0, 0, 850, 500])   
plot((x_valores-1), Er_Z_Y,'-p','LineWidth',2);
hold on
plot((x_valores-1),Er_ep_Y,'-o','LineWidth',2);
plot((x_valores-1),Er_mu_Y, '-sg','LineWidth',2);
hold off
% ylim([amp_min_ep amp_max_ep])
% xlim([freq(1) freq(end)])
lgd = legend('Impedancia Z', '\epsilon_r', '\mu_r')
lgd.FontSize = 14;
lgd.FontName = 'Times New Roman'
xlabel('Error angular [º]','Interpreter','latex','FontSize',14)
ylabel('Error porcentual [%]','FontSize',14)
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 14;
grid
xticks(0:5)

% Errores en Desalineamiento:

load(strcat(MEDIDAS_1,'Er_Z_des_PEC.mat'))
Er_Z_des = Er;
load(strcat(MEDIDAS_1,'Er_Ep_desPEC.mat'))
Er_ep_des = Er;
load(strcat(MEDIDAS_1,'Er_Mu_desPEC.mat'))
Er_mu_des = Er;

x_valores = 1:6;

nombre = 'Error Desalineamiento de puertos'
figure('Name', nombre + ", propiedades electromagnéticas",'Position', [0, 0, 850, 500])   
plot((x_valores-1)*0.1, Er_Z_des,'-p','LineWidth',2);
hold on
plot((x_valores-1)*0.1,Er_ep_des,'-o','LineWidth',2);
plot((x_valores-1)*0.1,Er_mu_des, '-sg','LineWidth',2);
hold off
% ylim([amp_min_ep amp_max_ep])
% xlim([freq(1) freq(end)])
lgd = legend('Impedancia Z', '\epsilon_r', '\mu_r')
lgd.FontSize = 14;
lgd.FontName = 'Times New Roman'
xlabel('Desalineamiento entre puertos [mm]','Interpreter','latex','FontSize',14)
ylabel('Error porcentual [%]','FontSize',14)
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 14;
grid
xticks(0:0.1:5)



