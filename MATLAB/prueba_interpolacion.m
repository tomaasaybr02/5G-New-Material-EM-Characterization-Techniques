clear all
close all
clc

x = 1:13;
y = [2 2.2 2.1 1.9 1.8 5 11 5 2 2 2 2 2];
n_subconjunto = 4;  % Número de puntos en el subconjunto
orden = 4;  % Orden del polinomio

% Interpolación generalizada
y_interp = interpolacionPorSegmentos(x, y, n_subconjunto, orden);

% Gráfica de resultados
plot(x, y, 'o', x, y_interp, '-');
legend('Datos conocidos', 'Interpolación');
xlabel('x');
ylabel('y');
title('Interpolación de Lagrange para Corrección de Errores');
grid



