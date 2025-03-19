%% PRUEBA PARA UNIÓN DE BANDAS DE FRECUENCIA:

clear all
close all
clc

% Metacrilato, todas las bandas menos la última:

% En primer lugar habrá que recortar el exceso de muestras a causa del 
% enventado, quedándonos con las bandas concretas para poder juntarlas
% posteriormente.

current_path = pwd;

%Primera banda, 33-50 GHz
MEDIDAS_1 = [current_path '/Resultados/Metacrilato/Parámetros Banda 33-50 GHz/'];

load(strcat(MEDIDAS_1,'freq_33_50.mat'))
f_min_33_50 = 274;
f_max_33_50 = 1820;
freq_33_50 = freq(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'ep_real_33_50.mat'))
ep_real_33_50 = ep_real(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'ep_imag_33_50.mat'))
ep_imag_33_50 = ep_imag(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'mu_real_33_50.mat'))
mu_real_33_50 = mu_real(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'mu_imag_33_50.mat'))
mu_imag_33_50 = mu_imag(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'n2_33_50.mat'))
n2_33_50 = n2(f_min_33_50:f_max_33_50);

% Segunda banda, 50-67 GHz
MEDIDAS_2 = [current_path '/Resultados/Metacrilato/Parámetros Banda 50-67 GHz/'];

load(strcat(MEDIDAS_2,'freq_50_67.mat'))
f_min_50_67 = 183;
f_max_50_67 = length(freq);
freq_50_67 = freq(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'ep_real_50_67.mat'))
ep_real_50_67 = ep_real(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'ep_imag_50_67.mat'))
ep_imag_50_67 = ep_imag(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'mu_real_50_67.mat'))
mu_real_50_67 = mu_real(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'mu_imag_50_67.mat'))
mu_imag_50_67 = mu_imag(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'n2_50_67.mat'))
n2_50_67 = n2(f_min_50_67:f_max_50_67);

% Tercera banda, 22-33 GHz
MEDIDAS_3 = [current_path '/Resultados/Metacrilato/Parámetros Banda 22-33 GHz/'];

load(strcat(MEDIDAS_3,'freq_22_33.mat'))
f_min_22_33 = 268;
f_max_22_33 = 1735;
freq_22_33 = freq(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'ep_real_22_33.mat'))
ep_real_22_33 = ep_real(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'ep_imag_22_33.mat'))
ep_imag_22_33 = ep_imag(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'mu_real_22_33.mat'))
mu_real_22_33 = mu_real(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'mu_imag_22_33.mat'))
mu_imag_22_33 = mu_imag(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'n2_22_33.mat'))
n2_22_33 = n2(f_min_22_33:f_max_22_33);

% Cuarta banda, 15-22 GHz
MEDIDAS_4 = [current_path '/Resultados/Metacrilato/Parámetros Banda 15-22 GHz/'];

load(strcat(MEDIDAS_4,'freq_15_22.mat'))
f_min_15_22 = 335;
f_max_15_22 = 1501;
freq_15_22 = freq(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'ep_real_15_22.mat'))
ep_real_15_22 = ep_real(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'ep_imag_15_22.mat'))
ep_imag_15_22 = ep_imag(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'mu_real_15_22.mat'))
mu_real_15_22 = mu_real(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'mu_imag_15_22.mat'))
mu_imag_15_22 = mu_imag(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'n2_15_22.mat'))
n2_15_22 = n2(f_min_15_22:f_max_15_22);

% Quinta banda, 15-22 GHz
MEDIDAS_5 = [current_path '/Resultados/Metacrilato/Parámetros Banda 10-15 GHz/'];

load(strcat(MEDIDAS_5,'freq_10_15.mat'))
f_min_10_15 = 401;
f_max_10_15 = 1401;
freq_10_15 = freq(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'ep_real_10_15.mat'))
ep_real_10_15 = ep_real(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'ep_imag_10_15.mat'))
ep_imag_10_15 = ep_imag(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'mu_real_10_15.mat'))
mu_real_10_15 = mu_real(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'mu_imag_10_15.mat'))
mu_imag_10_15 = mu_imag(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'n2_10_15.mat'))
n2_10_15 = n2(f_min_10_15:f_max_10_15);

% Sexta banda, 75-110 GHz
MEDIDAS_6 = [current_path '/Resultados/Metacrilato/Parámetros Banda 75-110 GHz/'];

load(strcat(MEDIDAS_6,'freq_75_110.mat'))
f_min_75_110 = 2;
f_max_75_110 = 1906;
freq_75_110 = freq(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'ep_real_75_110.mat'))
ep_real_75_110 = ep_real(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'ep_imag_75_110.mat'))
ep_imag_75_110 = ep_imag(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'mu_real_75_110.mat'))
mu_real_75_110 = mu_real(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'mu_imag_75_110.mat'))
mu_imag_75_110 = mu_imag(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'n2_75_110.mat'))
n2_75_110 = n2(f_min_75_110:f_max_75_110);

%HACER ESTA FUMADA

% Bandas interpoladas
MEDIDAS_7 = [current_path '/Resultados/Metacrilato/Interpolaciones/'];

load(strcat(MEDIDAS_7,'ep_interp_10_15.mat'))
ep_interp_10_15 = ep_interp';
load(strcat(MEDIDAS_7,'ep_interp_15_22.mat'))
ep_interp_15_22 = ep_interp';
load(strcat(MEDIDAS_7,'ep_interp_22_33.mat'))
ep_interp_22_33 = ep_interp';
load(strcat(MEDIDAS_7,'ep_interp_33_50.mat'))
ep_interp_33_50 = ep_interp';
load(strcat(MEDIDAS_7,'ep_interp_50_67.mat'))
ep_interp_50_67 = ep_interp';
load(strcat(MEDIDAS_7,'ep_interp_75_110.mat'))
ep_interp_75_110 = ep_interp';
%ep_interp_union = [ep_interp_10_15;ep_interp_15_22;ep_interp_22_33(2:end);ep_interp_33_50(2:end); ep_interp_50_67(2:end);ep_interp_75_110];
load(strcat(MEDIDAS_7,'ep_interp_banda_completa.mat'))
ep_interp_union = ep_interp';

load(strcat(MEDIDAS_7,'mu_interp_10_15.mat'))
mu_interp_10_15 = mu_interp';
load(strcat(MEDIDAS_7,'mu_interp_15_22.mat'))
mu_interp_15_22 = mu_interp';
load(strcat(MEDIDAS_7,'mu_interp_22_33.mat'))
mu_interp_22_33 = mu_interp';
load(strcat(MEDIDAS_7,'mu_interp_33_50.mat'))
mu_interp_33_50 = mu_interp';
load(strcat(MEDIDAS_7,'mu_interp_50_67.mat'))
mu_interp_50_67 = mu_interp';
load(strcat(MEDIDAS_7,'mu_interp_75_110.mat'))
mu_interp_75_110 = mu_interp';
%mu_interp_union = [mu_interp_10_15;mu_interp_15_22;mu_interp_22_33(2:end);mu_interp_33_50(2:end); mu_interp_50_67(2:end);mu_interp_75_110];
load(strcat(MEDIDAS_7,'mu_interp_banda_completa.mat'))
mu_interp_union = mu_interp';

% Pasamos ahora a unir las bandas en cuestión:

freq_union = [freq_10_15;freq_15_22;freq_22_33(2:end); freq_33_50(2:end); freq_50_67(2:end); freq_75_110];
mu_real_union = [mu_real_10_15;mu_real_15_22;mu_real_22_33(2:end);mu_real_33_50(2:end); mu_real_50_67(2:end);mu_real_75_110];
mu_imag_union = [mu_imag_10_15;mu_imag_15_22;mu_imag_22_33(2:end);mu_imag_33_50(2:end); mu_imag_50_67(2:end);mu_imag_75_110];
ep_real_union = [ep_real_10_15;ep_real_15_22;ep_real_22_33(2:end);ep_real_33_50(2:end); ep_real_50_67(2:end);ep_real_75_110];
ep_imag_union = [ep_imag_10_15;ep_imag_15_22;ep_imag_22_33(2:end);ep_imag_33_50(2:end); ep_imag_50_67(2:end);ep_imag_75_110];
n2_union = [n2_10_15;n2_15_22;n2_22_33(2:end);n2_33_50(2:end); n2_50_67(2:end);n2_75_110];


% Pasamos a hacer una prueba final representando esta unión:

nombre = 'Metacrilato 2.90mm';
amp_max_n2 = 6;
amp_min_n2 = -1;
amp_max_mu = 4;
amp_min_mu = -1;
amp_max_ep = 6;
amp_min_ep = -1;

representacion_uniones_bandas(freq_union, ep_real_union, ep_imag_union,...
    mu_real_union, mu_imag_union, mu_interp_union, ep_interp_union, n2_union, amp_max_n2, amp_min_n2, ...
    amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);


% representacion_uniones_bandas(freq_50_67, ep_real_50_67, ep_imag_50_67,...
%     mu_real_50_67, mu_imag_50_67, n2_50_67, amp_max_n2, amp_min_n2, ...
%     amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);
%%
% Pasamos a realizar la estimación polinómica encargada de eliminar las
% resonancias de epsilin y mu.
n_subconjunto = 4;  % Número de puntos en el subconjunto
orden = 2;  % Orden del polinomio

% Interpolación generalizada

mu_interp = interpolacionPorSegmentos(freq_union, mu_real_union,n_subconjunto,orden);
ep_interp = interpolacionPorSegmentos(freq_union, ep_real_union,n_subconjunto,orden);
%plot(mu_interp)

representacion_uniones_bandas_interp(freq_union, ep_real_union, ep_imag_union,...
     ep_interp, mu_real_union, mu_imag_union, mu_interp, n2_union, amp_max_n2, amp_min_n2, ...
     amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);

% mu_interp = interpolacionPorSegmentos(freq_union, mu_real_union,n_subconjunto,orden);
% ep_interp = interpolacionPorSegmentos(freq_union, ep_real_union,n_subconjunto,orden);
% plot(mu_interp)
% 
% representacion_uniones_bandas_interp(freq_union, ep_real_union, ep_imag_union,...
%      ep_interp, mu_real_union, mu_imag_union, mu_interp, n2_union, amp_max_n2, amp_min_n2, ...
%      amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);

%% clear all
close all
clc

% Teflón, todas las bandas menos la última:

current_path = pwd;

%Primera banda, 33-50 GHz
MEDIDAS_1 = [current_path '/Resultados/Teflon/Parámetros Banda 33-50 GHz/'];

load(strcat(MEDIDAS_1,'freq_33_50.mat'))
f_min_33_50 = 274;
f_max_33_50 = 1820;
freq_33_50 = freq(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'ep_real_33_50.mat'))
ep_real_33_50 = ep_real(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'ep_imag_33_50.mat'))
ep_imag_33_50 = ep_imag(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'mu_real_33_50.mat'))
mu_real_33_50 = mu_real(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'mu_imag_33_50.mat'))
mu_imag_33_50 = mu_imag(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'n2_33_50.mat'))
n2_33_50 = n2(f_min_33_50:f_max_33_50);

% Segunda banda, 50-67 GHz
MEDIDAS_2 = [current_path '/Resultados/Teflon/Parámetros Banda 50-67 GHz/'];

load(strcat(MEDIDAS_2,'freq_50_67.mat'))
f_min_50_67 = 183;
f_max_50_67 = length(freq);
freq_50_67 = freq(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'ep_real_50_67.mat'))
ep_real_50_67 = ep_real(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'ep_imag_50_67.mat'))
ep_imag_50_67 = ep_imag(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'mu_real_50_67.mat'))
mu_real_50_67 = mu_real(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'mu_imag_50_67.mat'))
mu_imag_50_67 = mu_imag(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'n2_50_67.mat'))
n2_50_67 = n2(f_min_50_67:f_max_50_67);

% Tercera banda, 22-33 GHz
MEDIDAS_3 = [current_path '/Resultados/Teflon/Parámetros Banda 22-33 GHz/'];

load(strcat(MEDIDAS_3,'freq_22_33.mat'))
f_min_22_33 = 268;
f_max_22_33 = 1735;
freq_22_33 = freq(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'ep_real_22_33.mat'))
ep_real_22_33 = ep_real(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'ep_imag_22_33.mat'))
ep_imag_22_33 = ep_imag(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'mu_real_22_33.mat'))
mu_real_22_33 = mu_real(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'mu_imag_22_33.mat'))
mu_imag_22_33 = mu_imag(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'n2_22_33.mat'))
n2_22_33 = n2(f_min_22_33:f_max_22_33);

% Cuarta banda, 15-22 GHz
MEDIDAS_4 = [current_path '/Resultados/Teflon/Parámetros Banda 15-22 GHz/'];

load(strcat(MEDIDAS_4,'freq_15_22.mat'))
f_min_15_22 = 335;
f_max_15_22 = 1501;
freq_15_22 = freq(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'ep_real_15_22.mat'))
ep_real_15_22 = ep_real(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'ep_imag_15_22.mat'))
ep_imag_15_22 = ep_imag(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'mu_real_15_22.mat'))
mu_real_15_22 = mu_real(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'mu_imag_15_22.mat'))
mu_imag_15_22 = mu_imag(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'n2_15_22.mat'))
n2_15_22 = n2(f_min_15_22:f_max_15_22);

% Quinta banda, 15-22 GHz
MEDIDAS_5 = [current_path '/Resultados/Teflon/Parámetros Banda 10-15 GHz/'];

load(strcat(MEDIDAS_5,'freq_10_15.mat'))
f_min_10_15 = 401;
f_max_10_15 = 1401;
freq_10_15 = freq(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'ep_real_10_15.mat'))
ep_real_10_15 = ep_real(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'ep_imag_10_15.mat'))
ep_imag_10_15 = ep_imag(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'mu_real_10_15.mat'))
mu_real_10_15 = mu_real(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'mu_imag_10_15.mat'))
mu_imag_10_15 = mu_imag(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'n2_10_15.mat'))
n2_10_15 = n2(f_min_10_15:f_max_10_15);

% Sexta banda, 75-110 GHz
MEDIDAS_6 = [current_path '/Resultados/Teflon/Parámetros Banda 75-110 GHz/'];

load(strcat(MEDIDAS_6,'freq_75_110.mat'))
f_min_75_110 = 2;
f_max_75_110 = 1906;
freq_75_110 = freq(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'ep_real_75_110.mat'))
ep_real_75_110 = ep_real(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'ep_imag_75_110.mat'))
ep_imag_75_110 = ep_imag(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'mu_real_75_110.mat'))
mu_real_75_110 = mu_real(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'mu_imag_75_110.mat'))
mu_imag_75_110 = mu_imag(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'n2_75_110.mat'))
n2_75_110 = n2(f_min_75_110:f_max_75_110);

% Bandas interpoladas

MEDIDAS_7 = [current_path '/Resultados/Teflon/Interpolaciones/'];

load(strcat(MEDIDAS_7,'ep_interp_banda_completa.mat'))
ep_interp_union = ep_interp';

load(strcat(MEDIDAS_7,'mu_interp_banda_completa.mat'))
mu_interp_union = mu_interp';

% Pasamos ahora a unir las bandas en cuestión:

freq_union = [freq_10_15;freq_15_22;freq_22_33(2:end); freq_33_50(2:end); freq_50_67(2:end); freq_75_110];
mu_real_union = [mu_real_10_15;mu_real_15_22;mu_real_22_33(2:end);mu_real_33_50(2:end); mu_real_50_67(2:end);mu_real_75_110];
mu_imag_union = [mu_imag_10_15;mu_imag_15_22;mu_imag_22_33(2:end);mu_imag_33_50(2:end); mu_imag_50_67(2:end);mu_imag_75_110];
ep_real_union = [ep_real_10_15;ep_real_15_22;ep_real_22_33(2:end);ep_real_33_50(2:end); ep_real_50_67(2:end);ep_real_75_110];
ep_imag_union = [ep_imag_10_15;ep_imag_15_22;ep_imag_22_33(2:end);ep_imag_33_50(2:end); ep_imag_50_67(2:end);ep_imag_75_110];
n2_union = [n2_10_15;n2_15_22;n2_22_33(2:end);n2_33_50(2:end); n2_50_67(2:end);n2_75_110];

% Pasamos a hacer una prueba final representando esta unión:

nombre = 'Teflón 4.04mm';
amp_max_n2 = 6;
amp_min_n2 = -1;
amp_max_mu = 4;
amp_min_mu = -1;
amp_max_ep = 6;
amp_min_ep = -1;

representacion_uniones_bandas(freq_union, ep_real_union, ep_imag_union,...
    mu_real_union, mu_imag_union, mu_interp_union, ep_interp_union, n2_union, amp_max_n2, amp_min_n2, ...
    amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);

%%
% Pasamos a realizar la estimación polinómica encargada de eliminar las
% resonancias de epsilin y mu.
n_subconjunto = 3;  % Número de puntos en el subconjunto
orden = 3;  % Orden del polinomio

% Interpolación generalizada

mu_interp = interpolacionPorSegmentos(freq_union, mu_real_union,n_subconjunto,orden);
ep_interp = interpolacionPorSegmentos(freq_union, ep_real_union,n_subconjunto,orden);
%plot(mu_interp)

representacion_uniones_bandas_interp(freq_union, ep_real_union, ep_imag_union,...
     ep_interp, mu_real_union, mu_imag_union, mu_interp, n2_union, amp_max_n2, amp_min_n2, ...
     amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);

% mu_interp = interpolacionPorSegmentos(freq_union, mu_real_union,n_subconjunto,orden);
% ep_interp = interpolacionPorSegmentos(freq_union, ep_real_union,n_subconjunto,orden);
% plot(mu_interp)
% 
% representacion_uniones_bandas_interp(freq_union, ep_real_union, ep_imag_union,...
%      ep_interp, mu_real_union, mu_imag_union, mu_interp, n2_union, amp_max_n2, amp_min_n2, ...
%      amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);

%%
clear all
close all
clc

% INTA C1, todas las bandas menos la última:

current_path = pwd;

%Primera banda, 33-50 GHz
MEDIDAS_1 = [current_path '/Resultados/INTA C1/Parámetros Banda 33-50 GHz/'];

load(strcat(MEDIDAS_1,'freq_33_50.mat'))
f_min_33_50 = 274;
f_max_33_50 = 1820;
freq_33_50 = freq(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'ep_real_33_50.mat'))
ep_real_33_50 = ep_real(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'ep_imag_33_50.mat'))
ep_imag_33_50 = ep_imag(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'mu_real_33_50.mat'))
mu_real_33_50 = mu_real(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'mu_imag_33_50.mat'))
mu_imag_33_50 = mu_imag(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'n2_33_50.mat'))
n2_33_50 = n2(f_min_33_50:f_max_33_50);

% Segunda banda, 50-67 GHz
MEDIDAS_2 = [current_path '/Resultados/INTA C1/Parámetros Banda 50-67 GHz/'];

load(strcat(MEDIDAS_2,'freq_50_67.mat'))
f_min_50_67 = 183;
f_max_50_67 = length(freq);
freq_50_67 = freq(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'ep_real_50_67.mat'))
ep_real_50_67 = ep_real(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'ep_imag_50_67.mat'))
ep_imag_50_67 = ep_imag(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'mu_real_50_67.mat'))
mu_real_50_67 = mu_real(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'mu_imag_50_67.mat'))
mu_imag_50_67 = mu_imag(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'n2_50_67.mat'))
n2_50_67 = n2(f_min_50_67:f_max_50_67);

% Tercera banda, 22-33 GHz
MEDIDAS_3 = [current_path '/Resultados/INTA C1/Parámetros Banda 22-33 GHz/'];

load(strcat(MEDIDAS_3,'freq_22_33.mat'))
f_min_22_33 = 268;
f_max_22_33 = 1735;
freq_22_33 = freq(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'ep_real_22_33.mat'))
ep_real_22_33 = ep_real(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'ep_imag_22_33.mat'))
ep_imag_22_33 = ep_imag(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'mu_real_22_33.mat'))
mu_real_22_33 = mu_real(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'mu_imag_22_33.mat'))
mu_imag_22_33 = mu_imag(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'n2_22_33.mat'))
n2_22_33 = n2(f_min_22_33:f_max_22_33);

% Cuarta banda, 15-22 GHz
MEDIDAS_4 = [current_path '/Resultados/INTA C1/Parámetros Banda 15-22 GHz/'];

load(strcat(MEDIDAS_4,'freq_15_22.mat'))
f_min_15_22 = 335;
f_max_15_22 = 1501;
freq_15_22 = freq(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'ep_real_15_22.mat'))
ep_real_15_22 = ep_real(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'ep_imag_15_22.mat'))
ep_imag_15_22 = ep_imag(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'mu_real_15_22.mat'))
mu_real_15_22 = mu_real(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'mu_imag_15_22.mat'))
mu_imag_15_22 = mu_imag(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'n2_15_22.mat'))
n2_15_22 = n2(f_min_15_22:f_max_15_22);

% Quinta banda, 15-22 GHz
MEDIDAS_5 = [current_path '/Resultados/INTA C1/Parámetros Banda 10-15 GHz/'];

load(strcat(MEDIDAS_5,'freq_10_15.mat'))
f_min_10_15 = 401;
f_max_10_15 = 1401;
freq_10_15 = freq(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'ep_real_10_15.mat'))
ep_real_10_15 = ep_real(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'ep_imag_10_15.mat'))
ep_imag_10_15 = ep_imag(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'mu_real_10_15.mat'))
mu_real_10_15 = mu_real(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'mu_imag_10_15.mat'))
mu_imag_10_15 = mu_imag(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'n2_10_15.mat'))
n2_10_15 = n2(f_min_10_15:f_max_10_15);

% Sexta banda, 75-110 GHz
MEDIDAS_6 = [current_path '/Resultados/INTA C1/Parámetros Banda 75-110 GHz/'];

load(strcat(MEDIDAS_6,'freq_75_110.mat'))
f_min_75_110 = 2;
f_max_75_110 = 1906;
freq_75_110 = freq(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'ep_real_75_110.mat'))
ep_real_75_110 = ep_real(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'ep_imag_75_110.mat'))
ep_imag_75_110 = ep_imag(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'mu_real_75_110.mat'))
mu_real_75_110 = mu_real(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'mu_imag_75_110.mat'))
mu_imag_75_110 = mu_imag(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'n2_75_110.mat'))
n2_75_110 = n2(f_min_75_110:f_max_75_110);

% Bandas interpoladas

MEDIDAS_7 = [current_path '/Resultados/INTA C1/Interpolaciones/'];

load(strcat(MEDIDAS_7,'ep_interp_banda_completa.mat'))
ep_interp_union = ep_interp';

load(strcat(MEDIDAS_7,'mu_interp_banda_completa.mat'))
mu_interp_union = mu_interp';

% Pasamos ahora a unir las bandas en cuestión:

freq_union = [freq_10_15;freq_15_22;freq_22_33(2:end); freq_33_50(2:end); freq_50_67(2:end); freq_75_110];
mu_real_union = [mu_real_10_15;mu_real_15_22;mu_real_22_33(2:end);mu_real_33_50(2:end); mu_real_50_67(2:end);mu_real_75_110];
mu_imag_union = [mu_imag_10_15;mu_imag_15_22;mu_imag_22_33(2:end);mu_imag_33_50(2:end); mu_imag_50_67(2:end);mu_imag_75_110];
ep_real_union = [ep_real_10_15;ep_real_15_22;ep_real_22_33(2:end);ep_real_33_50(2:end); ep_real_50_67(2:end);ep_real_75_110];
ep_imag_union = [ep_imag_10_15;ep_imag_15_22;ep_imag_22_33(2:end);ep_imag_33_50(2:end); ep_imag_50_67(2:end);ep_imag_75_110];
n2_union = [n2_10_15;n2_15_22;n2_22_33(2:end);n2_33_50(2:end); n2_50_67(2:end);n2_75_110];

% Pasamos a hacer una prueba final representando esta unión:

nombre = 'INTA C1 4.25mm';
amp_max_n2 = 6;
amp_min_n2 = -1;
amp_max_mu = 4;
amp_min_mu = -1;
amp_max_ep = 6;
amp_min_ep = -1;

representacion_uniones_bandas(freq_union, ep_real_union, ep_imag_union,...
    mu_real_union, mu_imag_union, mu_interp_union, ep_interp_union, n2_union, amp_max_n2, amp_min_n2, ...
    amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);

%%
% Pasamos a realizar la estimación polinómica encargada de eliminar las
% resonancias de epsilin y mu.
n_subconjunto = 5;  % Número de puntos en el subconjunto
orden = 2;  % Orden del polinomio

% Interpolación generalizada

mu_interp = interpolacionPorSegmentos(freq_union, mu_real_union,n_subconjunto,orden);
ep_interp = interpolacionPorSegmentos(freq_union, ep_real_union,n_subconjunto,orden);
%plot(mu_interp)

representacion_uniones_bandas_interp(freq_union, ep_real_union, ep_imag_union,...
     ep_interp, mu_real_union, mu_imag_union, mu_interp, n2_union, amp_max_n2, amp_min_n2, ...
     amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);

% mu_interp = interpolacionPorSegmentos(freq_union, mu_real_union,n_subconjunto,orden);
% ep_interp = interpolacionPorSegmentos(freq_union, ep_real_union,n_subconjunto,orden);
% plot(mu_interp)
% 
% representacion_uniones_bandas_interp(freq_union, ep_real_union, ep_imag_union,...
%      ep_interp, mu_real_union, mu_imag_union, mu_interp, n2_union, amp_max_n2, amp_min_n2, ...
%      amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);

%%
clear all
close all
clc

% INTA 11C8, todas las bandas menos la última:

current_path = pwd;

%Primera banda, 33-50 GHz
MEDIDAS_1 = [current_path '/Resultados/INTA 11C8/Parámetros Banda 33-50 GHz/'];

load(strcat(MEDIDAS_1,'freq_33_50.mat'))
f_min_33_50 = 274;
f_max_33_50 = 1820;
freq_33_50 = freq(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'ep_real_33_50.mat'))
ep_real_33_50 = ep_real(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'ep_imag_33_50.mat'))
ep_imag_33_50 = ep_imag(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'mu_real_33_50.mat'))
mu_real_33_50 = mu_real(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'mu_imag_33_50.mat'))
mu_imag_33_50 = mu_imag(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'n2_33_50.mat'))
n2_33_50 = n2(f_min_33_50:f_max_33_50);

% Segunda banda, 50-67 GHz
MEDIDAS_2 = [current_path '/Resultados/INTA 11C8/Parámetros Banda 50-67 GHz/'];

load(strcat(MEDIDAS_2,'freq_50_67.mat'))
f_min_50_67 = 183;
f_max_50_67 = length(freq);
freq_50_67 = freq(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'ep_real_50_67.mat'))
ep_real_50_67 = ep_real(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'ep_imag_50_67.mat'))
ep_imag_50_67 = ep_imag(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'mu_real_50_67.mat'))
mu_real_50_67 = mu_real(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'mu_imag_50_67.mat'))
mu_imag_50_67 = mu_imag(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'n2_50_67.mat'))
n2_50_67 = n2(f_min_50_67:f_max_50_67);

% Tercera banda, 22-33 GHz
MEDIDAS_3 = [current_path '/Resultados/INTA 11C8/Parámetros Banda 22-33 GHz/'];

load(strcat(MEDIDAS_3,'freq_22_33.mat'))
f_min_22_33 = 268;
f_max_22_33 = 1735;
freq_22_33 = freq(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'ep_real_22_33.mat'))
ep_real_22_33 = ep_real(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'ep_imag_22_33.mat'))
ep_imag_22_33 = ep_imag(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'mu_real_22_33.mat'))
mu_real_22_33 = mu_real(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'mu_imag_22_33.mat'))
mu_imag_22_33 = mu_imag(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'n2_22_33.mat'))
n2_22_33 = n2(f_min_22_33:f_max_22_33);

% Cuarta banda, 15-22 GHz
MEDIDAS_4 = [current_path '/Resultados/INTA 11C8/Parámetros Banda 15-22 GHz/'];

load(strcat(MEDIDAS_4,'freq_15_22.mat'))
f_min_15_22 = 335;
f_max_15_22 = 1501;
freq_15_22 = freq(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'ep_real_15_22.mat'))
ep_real_15_22 = ep_real(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'ep_imag_15_22.mat'))
ep_imag_15_22 = ep_imag(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'mu_real_15_22.mat'))
mu_real_15_22 = mu_real(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'mu_imag_15_22.mat'))
mu_imag_15_22 = mu_imag(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'n2_15_22.mat'))
n2_15_22 = n2(f_min_15_22:f_max_15_22);

% Quinta banda, 15-22 GHz
MEDIDAS_5 = [current_path '/Resultados/INTA 11C8/Parámetros Banda 10-15 GHz/'];

load(strcat(MEDIDAS_5,'freq_10_15.mat'))
f_min_10_15 = 401;
f_max_10_15 = 1401;
freq_10_15 = freq(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'ep_real_10_15.mat'))
ep_real_10_15 = ep_real(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'ep_imag_10_15.mat'))
ep_imag_10_15 = ep_imag(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'mu_real_10_15.mat'))
mu_real_10_15 = mu_real(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'mu_imag_10_15.mat'))
mu_imag_10_15 = mu_imag(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'n2_10_15.mat'))
n2_10_15 = n2(f_min_10_15:f_max_10_15);

% Sexta banda, 75-110 GHz
MEDIDAS_6 = [current_path '/Resultados/INTA 11C8/Parámetros Banda 75-110 GHz/'];

load(strcat(MEDIDAS_6,'freq_75_110.mat'))
f_min_75_110 = 2;
f_max_75_110 = 1906;
freq_75_110 = freq(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'ep_real_75_110.mat'))
ep_real_75_110 = ep_real(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'ep_imag_75_110.mat'))
ep_imag_75_110 = ep_imag(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'mu_real_75_110.mat'))
mu_real_75_110 = mu_real(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'mu_imag_75_110.mat'))
mu_imag_75_110 = mu_imag(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'n2_75_110.mat'))
n2_75_110 = n2(f_min_75_110:f_max_75_110);

% Bandas interpoladas

MEDIDAS_7 = [current_path '/Resultados/INTA 11C8/Interpolaciones/'];

load(strcat(MEDIDAS_7,'ep_interp_banda_completa.mat'))
ep_interp_union = ep_interp';

load(strcat(MEDIDAS_7,'mu_interp_banda_completa.mat'))
mu_interp_union = mu_interp';

% Pasamos ahora a unir las bandas en cuestión:

freq_union = [freq_10_15;freq_15_22;freq_22_33(2:end); freq_33_50(2:end); freq_50_67(2:end); freq_75_110];
mu_real_union = [mu_real_10_15;mu_real_15_22;mu_real_22_33(2:end);mu_real_33_50(2:end); mu_real_50_67(2:end);mu_real_75_110];
mu_imag_union = [mu_imag_10_15;mu_imag_15_22;mu_imag_22_33(2:end);mu_imag_33_50(2:end); mu_imag_50_67(2:end);mu_imag_75_110];
ep_real_union = [ep_real_10_15;ep_real_15_22;ep_real_22_33(2:end);ep_real_33_50(2:end); ep_real_50_67(2:end);ep_real_75_110];
ep_imag_union = [ep_imag_10_15;ep_imag_15_22;ep_imag_22_33(2:end);ep_imag_33_50(2:end); ep_imag_50_67(2:end);ep_imag_75_110];
n2_union = [n2_10_15;n2_15_22;n2_22_33(2:end);n2_33_50(2:end); n2_50_67(2:end);n2_75_110];

% Pasamos a hacer una prueba final representando esta unión:

nombre = 'INTA 11C8 4.08mm';
amp_max_n2 = 6;
amp_min_n2 = -1;
amp_max_mu = 4;
amp_min_mu = -1;
amp_max_ep = 6;
amp_min_ep = -1;

representacion_uniones_bandas(freq_union, ep_real_union, ep_imag_union,...
    mu_real_union, mu_imag_union, mu_interp_union, ep_interp_union, n2_union, amp_max_n2, amp_min_n2, ...
    amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);

%%
% Pasamos a realizar la estimación polinómica encargada de eliminar las
% resonancias de epsilin y mu.
n_subconjunto = 4;  % Número de puntos en el subconjunto
orden = 3;  % Orden del polinomio

% Interpolación generalizada

mu_interp = interpolacionPorSegmentos(freq_union, mu_real_union,n_subconjunto,orden);
ep_interp = interpolacionPorSegmentos(freq_union, ep_real_union,n_subconjunto,orden);
%plot(mu_interp)

representacion_uniones_bandas_interp(freq_union, ep_real_union, ep_imag_union,...
     ep_interp, mu_real_union, mu_imag_union, mu_interp, n2_union, amp_max_n2, amp_min_n2, ...
     amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);

% mu_interp = interpolacionPorSegmentos(freq_union, mu_real_union,n_subconjunto,orden);
% ep_interp = interpolacionPorSegmentos(freq_union, ep_real_union,n_subconjunto,orden);
% plot(mu_interp)
% 
% representacion_uniones_bandas_interp(freq_union, ep_real_union, ep_imag_union,...
%      ep_interp, mu_real_union, mu_imag_union, mu_interp, n2_union, amp_max_n2, amp_min_n2, ...
%      amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);

%%
clear all
close all
clc

% INTA 11C18, todas las bandas menos la última:

current_path = pwd;

%Primera banda, 33-50 GHz
MEDIDAS_1 = [current_path '/Resultados/INTA 11C18/Parámetros Banda 33-50 GHz/'];

load(strcat(MEDIDAS_1,'freq_33_50.mat'))
f_min_33_50 = 274;
f_max_33_50 = 1820;
freq_33_50 = freq(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'ep_real_33_50.mat'))
ep_real_33_50 = ep_real(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'ep_imag_33_50.mat'))
ep_imag_33_50 = ep_imag(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'mu_real_33_50.mat'))
mu_real_33_50 = mu_real(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'mu_imag_33_50.mat'))
mu_imag_33_50 = mu_imag(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'n2_33_50.mat'))
n2_33_50 = n2(f_min_33_50:f_max_33_50);

% Segunda banda, 50-67 GHz
MEDIDAS_2 = [current_path '/Resultados/INTA 11C18/Parámetros Banda 50-67 GHz/'];

load(strcat(MEDIDAS_2,'freq_50_67.mat'))
f_min_50_67 = 183;
f_max_50_67 = length(freq);
freq_50_67 = freq(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'ep_real_50_67.mat'))
ep_real_50_67 = ep_real(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'ep_imag_50_67.mat'))
ep_imag_50_67 = ep_imag(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'mu_real_50_67.mat'))
mu_real_50_67 = mu_real(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'mu_imag_50_67.mat'))
mu_imag_50_67 = mu_imag(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'n2_50_67.mat'))
n2_50_67 = n2(f_min_50_67:f_max_50_67);

% Tercera banda, 22-33 GHz
MEDIDAS_3 = [current_path '/Resultados/INTA 11C18/Parámetros Banda 22-33 GHz/'];

load(strcat(MEDIDAS_3,'freq_22_33.mat'))
f_min_22_33 = 268;
f_max_22_33 = 1735;
freq_22_33 = freq(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'ep_real_22_33.mat'))
ep_real_22_33 = ep_real(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'ep_imag_22_33.mat'))
ep_imag_22_33 = ep_imag(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'mu_real_22_33.mat'))
mu_real_22_33 = mu_real(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'mu_imag_22_33.mat'))
mu_imag_22_33 = mu_imag(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'n2_22_33.mat'))
n2_22_33 = n2(f_min_22_33:f_max_22_33);

% Cuarta banda, 15-22 GHz
MEDIDAS_4 = [current_path '/Resultados/INTA 11C18/Parámetros Banda 15-22 GHz/'];

load(strcat(MEDIDAS_4,'freq_15_22.mat'))
f_min_15_22 = 335;
f_max_15_22 = 1501;
freq_15_22 = freq(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'ep_real_15_22.mat'))
ep_real_15_22 = ep_real(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'ep_imag_15_22.mat'))
ep_imag_15_22 = ep_imag(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'mu_real_15_22.mat'))
mu_real_15_22 = mu_real(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'mu_imag_15_22.mat'))
mu_imag_15_22 = mu_imag(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'n2_15_22.mat'))
n2_15_22 = n2(f_min_15_22:f_max_15_22);

% Quinta banda, 15-22 GHz
MEDIDAS_5 = [current_path '/Resultados/INTA 11C18/Parámetros Banda 10-15 GHz/'];

load(strcat(MEDIDAS_5,'freq_10_15.mat'))
f_min_10_15 = 401;
f_max_10_15 = 1401;
freq_10_15 = freq(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'ep_real_10_15.mat'))
ep_real_10_15 = ep_real(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'ep_imag_10_15.mat'))
ep_imag_10_15 = ep_imag(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'mu_real_10_15.mat'))
mu_real_10_15 = mu_real(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'mu_imag_10_15.mat'))
mu_imag_10_15 = mu_imag(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'n2_10_15.mat'))
n2_10_15 = n2(f_min_10_15:f_max_10_15);

% Sexta banda, 75-110 GHz
MEDIDAS_6 = [current_path '/Resultados/INTA 11C18/Parámetros Banda 75-110 GHz/'];

load(strcat(MEDIDAS_6,'freq_75_110.mat'))
f_min_75_110 = 2;
f_max_75_110 = 1906;
freq_75_110 = freq(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'ep_real_75_110.mat'))
ep_real_75_110 = ep_real(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'ep_imag_75_110.mat'))
ep_imag_75_110 = ep_imag(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'mu_real_75_110.mat'))
mu_real_75_110 = mu_real(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'mu_imag_75_110.mat'))
mu_imag_75_110 = mu_imag(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'n2_75_110.mat'))
n2_75_110 = n2(f_min_75_110:f_max_75_110);

% Bandas interpoladas

MEDIDAS_7 = [current_path '/Resultados/INTA 11C18/Interpolaciones/'];

load(strcat(MEDIDAS_7,'ep_interp_banda_completa.mat'))
ep_interp_union = ep_interp';

load(strcat(MEDIDAS_7,'mu_interp_banda_completa.mat'))
mu_interp_union = mu_interp';

% Pasamos ahora a unir las bandas en cuestión:

freq_union = [freq_10_15;freq_15_22;freq_22_33(2:end); freq_33_50(2:end); freq_50_67(2:end); freq_75_110];
mu_real_union = [mu_real_10_15;mu_real_15_22;mu_real_22_33(2:end);mu_real_33_50(2:end); mu_real_50_67(2:end);mu_real_75_110];
mu_imag_union = [mu_imag_10_15;mu_imag_15_22;mu_imag_22_33(2:end);mu_imag_33_50(2:end); mu_imag_50_67(2:end);mu_imag_75_110];
ep_real_union = [ep_real_10_15;ep_real_15_22;ep_real_22_33(2:end);ep_real_33_50(2:end); ep_real_50_67(2:end);ep_real_75_110];
ep_imag_union = [ep_imag_10_15;ep_imag_15_22;ep_imag_22_33(2:end);ep_imag_33_50(2:end); ep_imag_50_67(2:end);ep_imag_75_110];
n2_union = [n2_10_15;n2_15_22;n2_22_33(2:end);n2_33_50(2:end); n2_50_67(2:end);n2_75_110];

% Pasamos a hacer una prueba final representando esta unión:

nombre = 'INTA 11C18 5.07mm';
amp_max_n2 = 6;
amp_min_n2 = -1;
amp_max_mu = 4;
amp_min_mu = -1;
amp_max_ep = 7;
amp_min_ep = -1;

representacion_uniones_bandas(freq_union, ep_real_union, ep_imag_union,...
    mu_real_union, mu_imag_union, mu_interp_union, ep_interp_union, n2_union, amp_max_n2, amp_min_n2, ...
    amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);

%%
% Pasamos a realizar la estimación polinómica encargada de eliminar las
% resonancias de epsilin y mu.
n_subconjunto = 2;  % Número de puntos en el subconjunto
orden = 2;  % Orden del polinomio

% Interpolación generalizada

mu_interp = interpolacionPorSegmentos(freq_union, mu_real_union,n_subconjunto,orden);
ep_interp = interpolacionPorSegmentos(freq_union, ep_real_union,n_subconjunto,orden);
%plot(mu_interp)

representacion_uniones_bandas_interp(freq_union, ep_real_union, ep_imag_union,...
     ep_interp, mu_real_union, mu_imag_union, mu_interp, n2_union, amp_max_n2, amp_min_n2, ...
     amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);

% mu_interp = interpolacionPorSegmentos(freq_union, mu_real_union,n_subconjunto,orden);
% ep_interp = interpolacionPorSegmentos(freq_union, ep_real_union,n_subconjunto,orden);
% plot(mu_interp)
% 
% representacion_uniones_bandas_interp(freq_union, ep_real_union, ep_imag_union,...
%      ep_interp, mu_real_union, mu_imag_union, mu_interp, n2_union, amp_max_n2, amp_min_n2, ...
%      amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);

%%
clear all
close all
clc

% INTA C8, todas las bandas menos la última:

current_path = pwd;

%Primera banda, 33-50 GHz
MEDIDAS_1 = [current_path '/Resultados/INTA C8/Parámetros Banda 33-50 GHz/'];

load(strcat(MEDIDAS_1,'freq_33_50.mat'))
f_min_33_50 = 274;
f_max_33_50 = 1820;
freq_33_50 = freq(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'ep_real_33_50.mat'))
ep_real_33_50 = ep_real(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'ep_imag_33_50.mat'))
ep_imag_33_50 = ep_imag(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'mu_real_33_50.mat'))
mu_real_33_50 = mu_real(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'mu_imag_33_50.mat'))
mu_imag_33_50 = mu_imag(f_min_33_50:f_max_33_50);
load(strcat(MEDIDAS_1,'n2_33_50.mat'))
n2_33_50 = n2(f_min_33_50:f_max_33_50);

% Segunda banda, 50-67 GHz
MEDIDAS_2 = [current_path '/Resultados/INTA C8/Parámetros Banda 50-67 GHz/'];

load(strcat(MEDIDAS_2,'freq_50_67.mat'))
f_min_50_67 = 183;
f_max_50_67 = length(freq);
freq_50_67 = freq(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'ep_real_50_67.mat'))
ep_real_50_67 = ep_real(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'ep_imag_50_67.mat'))
ep_imag_50_67 = ep_imag(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'mu_real_50_67.mat'))
mu_real_50_67 = mu_real(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'mu_imag_50_67.mat'))
mu_imag_50_67 = mu_imag(f_min_50_67:f_max_50_67);
load(strcat(MEDIDAS_2,'n2_50_67.mat'))
n2_50_67 = n2(f_min_50_67:f_max_50_67);

% Tercera banda, 22-33 GHz
MEDIDAS_3 = [current_path '/Resultados/INTA C8/Parámetros Banda 22-33 GHz/'];

load(strcat(MEDIDAS_3,'freq_22_33.mat'))
f_min_22_33 = 268;
f_max_22_33 = 1735;
freq_22_33 = freq(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'ep_real_22_33.mat'))
ep_real_22_33 = ep_real(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'ep_imag_22_33.mat'))
ep_imag_22_33 = ep_imag(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'mu_real_22_33.mat'))
mu_real_22_33 = mu_real(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'mu_imag_22_33.mat'))
mu_imag_22_33 = mu_imag(f_min_22_33:f_max_22_33);
load(strcat(MEDIDAS_3,'n2_22_33.mat'))
n2_22_33 = n2(f_min_22_33:f_max_22_33);

% Cuarta banda, 15-22 GHz
MEDIDAS_4 = [current_path '/Resultados/INTA C8/Parámetros Banda 15-22 GHz/'];

load(strcat(MEDIDAS_4,'freq_15_22.mat'))
f_min_15_22 = 335;
f_max_15_22 = 1501;
freq_15_22 = freq(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'ep_real_15_22.mat'))
ep_real_15_22 = ep_real(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'ep_imag_15_22.mat'))
ep_imag_15_22 = ep_imag(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'mu_real_15_22.mat'))
mu_real_15_22 = mu_real(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'mu_imag_15_22.mat'))
mu_imag_15_22 = mu_imag(f_min_15_22:f_max_15_22);
load(strcat(MEDIDAS_4,'n2_15_22.mat'))
n2_15_22 = n2(f_min_15_22:f_max_15_22);

% Quinta banda, 15-22 GHz
MEDIDAS_5 = [current_path '/Resultados/INTA C8/Parámetros Banda 10-15 GHz/'];

load(strcat(MEDIDAS_5,'freq_10_15.mat'))
f_min_10_15 = 401;
f_max_10_15 = 1401;
freq_10_15 = freq(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'ep_real_10_15.mat'))
ep_real_10_15 = ep_real(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'ep_imag_10_15.mat'))
ep_imag_10_15 = ep_imag(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'mu_real_10_15.mat'))
mu_real_10_15 = mu_real(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'mu_imag_10_15.mat'))
mu_imag_10_15 = mu_imag(f_min_10_15:f_max_10_15);
load(strcat(MEDIDAS_5,'n2_10_15.mat'))
n2_10_15 = n2(f_min_10_15:f_max_10_15);

% Sexta banda, 75-110 GHz
MEDIDAS_6 = [current_path '/Resultados/INTA C8/Parámetros Banda 75-110 GHz/'];

load(strcat(MEDIDAS_6,'freq_75_110.mat'))
f_min_75_110 = 2;
f_max_75_110 = 1906;
freq_75_110 = freq(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'ep_real_75_110.mat'))
ep_real_75_110 = ep_real(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'ep_imag_75_110.mat'))
ep_imag_75_110 = ep_imag(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'mu_real_75_110.mat'))
mu_real_75_110 = mu_real(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'mu_imag_75_110.mat'))
mu_imag_75_110 = mu_imag(f_min_75_110:f_max_75_110);
load(strcat(MEDIDAS_6,'n2_75_110.mat'))
n2_75_110 = n2(f_min_75_110:f_max_75_110);

% Bandas interpoladas

MEDIDAS_7 = [current_path '/Resultados/INTA C8/Interpolaciones/'];

load(strcat(MEDIDAS_7,'ep_interp_banda_completa.mat'))
ep_interp_union = ep_interp';

load(strcat(MEDIDAS_7,'mu_interp_banda_completa.mat'))
mu_interp_union = mu_interp';

% Pasamos ahora a unir las bandas en cuestión:

freq_union = [freq_10_15;freq_15_22;freq_22_33(2:end); freq_33_50(2:end); freq_50_67(2:end); freq_75_110];
mu_real_union = [mu_real_10_15;mu_real_15_22;mu_real_22_33(2:end);mu_real_33_50(2:end); mu_real_50_67(2:end);mu_real_75_110];
mu_imag_union = [mu_imag_10_15;mu_imag_15_22;mu_imag_22_33(2:end);mu_imag_33_50(2:end); mu_imag_50_67(2:end);mu_imag_75_110];
ep_real_union = [ep_real_10_15;ep_real_15_22;ep_real_22_33(2:end);ep_real_33_50(2:end); ep_real_50_67(2:end);ep_real_75_110];
ep_imag_union = [ep_imag_10_15;ep_imag_15_22;ep_imag_22_33(2:end);ep_imag_33_50(2:end); ep_imag_50_67(2:end);ep_imag_75_110];
n2_union = [n2_10_15;n2_15_22;n2_22_33(2:end);n2_33_50(2:end); n2_50_67(2:end);n2_75_110];

% Pasamos a hacer una prueba final representando esta unión:

nombre = 'INTA C8 6.41mm';
amp_max_n2 = 6;
amp_min_n2 = -1;
amp_max_mu = 4;
amp_min_mu = -1;
amp_max_ep = 7;
amp_min_ep = -1;

representacion_uniones_bandas(freq_union, ep_real_union, ep_imag_union,...
    mu_real_union, mu_imag_union, mu_interp_union, ep_interp_union, n2_union, amp_max_n2, amp_min_n2, ...
    amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);

%%
% Pasamos a realizar la estimación polinómica encargada de eliminar las
% resonancias de epsilin y mu.
n_subconjunto = 2;  % Número de puntos en el subconjunto
orden = 2;  % Orden del polinomio

% Interpolación generalizada

mu_interp = interpolacionPorSegmentos(freq_union, mu_real_union,n_subconjunto,orden);
ep_interp = interpolacionPorSegmentos(freq_union, ep_real_union,n_subconjunto,orden);
%plot(mu_interp)

representacion_uniones_bandas_interp(freq_union, ep_real_union, ep_imag_union,...
     ep_interp, mu_real_union, mu_imag_union, mu_interp, n2_union, amp_max_n2, amp_min_n2, ...
     amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);

% mu_interp = interpolacionPorSegmentos(freq_union, mu_real_union,n_subconjunto,orden);
% ep_interp = interpolacionPorSegmentos(freq_union, ep_real_union,n_subconjunto,orden);
% plot(mu_interp)
% 
% representacion_uniones_bandas_interp(freq_union, ep_real_union, ep_imag_union,...
%      ep_interp, mu_real_union, mu_imag_union, mu_interp, n2_union, amp_max_n2, amp_min_n2, ...
%      amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep, nombre);
