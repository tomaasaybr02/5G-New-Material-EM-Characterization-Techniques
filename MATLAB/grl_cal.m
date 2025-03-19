function cal=grl_cal(line,reflect,mut,d,sample)
% function cal=grl_cal(line,reflect,mut,d,sample)
% Artículo P. G. Bartley and S. B. Begley, "Improved Free-Space S-Parameter Calibration,...
% " 2005 IEEE Instrumentationand Measurement Technology Conference Proceedings,...
% Ottawa, ON, Canada, 2005, pp. 372-375, doi: 10.1109/IMTC.2005.1604138.
% Recibe los siguientes objetos:
% line: Objeto Parámetros S Medida con el porta muestras vacío
% reflect: Objeto Parámetros S Medida con el porta muestras con un metal
% mut: Objeto Parámetros S del material a caracterizar
% d: Grosor del plano de metal (en metros)
% sample: Grosor del material a caracterizar (en metros)

%% Definiciones previas
mm=1e-3;
c=physconst('LightSpeed');
Zref=50;
freq=line.Frequencies(1:end);
GHz = 1e9;

%% Cogemos S11 y S22 de la línea y del reflect para luego calcular coeficientes de reflexión
l11=reshape(line.Parameters(1,1,:),[1,size(line.Frequencies,1)]);
l22=reshape(line.Parameters(2,2,:),[1,size(line.Frequencies,1)]);
r11=reshape(reflect.Parameters(1,1,:),[1,size(reflect.Frequencies,1)]);
r22=reshape(reflect.Parameters(2,2,:),[1,size(reflect.Frequencies,1)]);

%PUERTO 1 Metal
m=1; n=1;
[t,ift]=ifft_zp(reflect,m,n); % Transformada a dominio del tiempo
figure('Name',"Reflexión Puerto 1",'Position', [0, 0, 850, 500])
plot(ifftshift(ift),'LineWidth',2); % Pinta la figura donde se coge la reflexión del metal
%xticklabel()
xlabel('Tiempo (ns)','Interpreter','latex','FontSize',14)
ylabel('Amplitud','FontSize',14)
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 14;
grid
%xlim([t(1)*1e9 t(end)*1e9])
%ylim([-0.05 0.05])
%Aquí se guarda la figura como un pdf:
% exportgraphics(gcf, 'pruebaPDF.pdf', 'Resolution', 300);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pause(0.1); % Para que le dé tiempo a Matlab a pintar la gráfica
%p1 = input("Introducir número de muestra del pico de transmisión: "); % Introducir el pico de la reflexión 
p1=(length(ift)+1)*0.5;
t1 = input("Introducir número de muestra del pico de reflexión: "); % Introducir el pico de la reflexión 
[~,o11]=fft_zp(enventanar(ift,p1,2*(t1-p1)-1),reflect); % Enventanado y fft

%PUERTO 2 Metal
m=2; n=2;
[t,ift]=ifft_zp(reflect,m,n); % Transformada a dominio del tiempo
figure('Name',"Reflexión Puerto 2",'Position', [0, 0, 850, 500])
plot(ifftshift(ift),'LineWidth',2); % Pinta la figura donde se coge la reflexión del metal
%xlim([freq(1)/GHz freq(end)/GHz])
xlabel('Muestras','Interpreter','latex','FontSize',14)
ylabel('Amplitud [W]','FontSize',14)
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 14;
grid
%xlim([t(1)*1e9 t(end)*1e9])
%ylim([-0.05 0.05])
pause(0.1); % Para que le dé tiempo a Matlab a pintar la gráfica
%p2 = input("Introducir número de muestra del pico de transmisión: "); % Introducir el pico de la reflexión 
p2=(length(ift)+1)*0.5;
t2 = input("Introducir número de muestra del pico de reflexión: "); % Introducir el pico de la reflexión
[f,t11]=fft_zp(enventanar(ift,p2,2*(t2-p2)-1),reflect); % Enventanado y fft

%PUERTO 1 Aire
m=1; n=1;
[t,ift]=ifft_zp(line,m,n); % Transformada a dominio del tiempo
figure();
plot(ifftshift(ift)),title('IFFT Puerto 1 Aire'); % Pinta la figura donde se coge la reflexión del metal

%PUERTO 2 Aire
m=2; n=2;
[t,ift]=ifft_zp(line,m,n); % Transformada a dominio del tiempo
figure();
plot(ifftshift(ift)),title('IFFT Puerto 2 Aire'); % Pinta la figura donde se coge la reflexión del metal


%% Restamos la parte de la antena y propagación y calculamos el resto de coeficientes

[t,ift_r11]=ifft_zp_tomas(r11,freq); 
[t,ift_o11]=ifft_zp_tomas(o11,freq);
[t,ift_r22]=ifft_zp_tomas(r22,freq); 
[t,ift_t11]=ifft_zp_tomas(t11,freq);
[t,ift_l11]=ifft_zp_tomas(l11,freq);
[t,ift_l22]=ifft_zp_tomas(l22,freq);


rho_metal_1=r11-o11;
[t,ift_rho_metal_1]=ifft_zp_tomas(rho_metal_1,freq); 

rho_metal_2=r22-t11; 
[t,ift_rho_metal_2]=ifft_zp_tomas(rho_metal_2,freq); 

rho_air_1=l11-o11; 
[t,ift_rho_air_1]=ifft_zp_tomas(rho_air_1,freq);

rho_air_2=l22-t11; 
[t,ift_rho_air_2]=ifft_zp_tomas(rho_air_2,freq); 

AA=exp(-1i*d*2*pi*f/c).*exp(-1i*d*2*pi*f/c);

%% Representación cálculo visual de los parámetros de reflexión del metal
figure('Name',"rho_11",'Position', [0, 0, 850, 300])
plot(t.*1e9,ifftshift(ift_r11),'LineWidth',2)%,title('r_{11}','FontName','Times New Roman','FontSize',14); 
grid
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 18;
xlabel('Tiempo (ns)','Interpreter','latex','FontSize',18)
ylabel('Amplitud','FontSize',18)
xlim([-10 15])
%xlim([t(1)*1e9 t(end)*1e9])
%ylim([-0.05 0.05])

figure('Name',"O_11",'Position', [0, 0, 850, 300])
plot(t.*1e9,ifftshift(ift_r11),'LineWidth',2)
hold on
plot(t.*1e9,ifftshift(ift_o11),'LineWidth',2)
hold off
lgd = legend('P_{11}', 'O_{11}')
lgd.FontSize = 18;
lgd.FontName = 'Times New Roman'
%title('O_{11}','FontName','Times New Roman','FontSize',14); 
grid
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 18;
xlabel('Tiempo (ns)','Interpreter','latex','FontSize',18)
ylabel('Amplitud','FontSize',18)
xlim([-10 15])
%xlim([t(1)*1e9 t(end)*1e9])
%ylim([-0.05 0.05])

figure('Name',"Gamma_1",'Position', [0, 0, 850, 300])
plot(t.*1e9,ifftshift(ift_rho_metal_1),'LineWidth',2)%,title('\Gamma_{1 Metal}','FontName','Times New Roman','FontSize',14);
grid
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 18;
xlabel('Tiempo (ns)','Interpreter','latex','FontSize',18)
ylabel('Amplitud','FontSize',18)
xlim([-10 15])
%xlim([t(1)*1e9 t(end)*1e9])
%ylim([-0.05 0.05])

%{
subplot(3,2,2)
plot(ifftshift(ift_r22)),title('IFFT r22','FontName','Times New Roman','FontSize',14); 
grid
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 14;
xlabel('Muestras','Interpreter','latex','FontSize',14)
ylabel('Potencia (W)','FontSize',14)
xlim([3000 8000])
subplot(3,2,4)
hold on
plot(ifftshift(ift_r22)),title('IFFT r22'); 
plot(ifftshift(ift_t11)),title('IFFT t11'); 
hold off
lgd = legend('r22', 't11')
lgd.FontSize = 14;
lgd.FontName = 'Times New Roman'
grid
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 14;
xlabel('Muestras','Interpreter','latex','FontSize',14)
ylabel('Potencia (W)','FontSize',14)
xlim([3000 8000])
subplot(3,2,6)
plot(ifftshift(ift_rho_metal_2)),title('IFFT \Gamma_{2 Metal}','FontName','Times New Roman','FontSize',14);
grid
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 14;
xlabel('Muestras','Interpreter','latex','FontSize',14)
ylabel('Potencia (W)','FontSize',14)
xlim([3000 8000])
%}
%% Representación cálculo visual de los parámetros de reflexión del aire
figure();
subplot(3,2,1)
plot(ifftshift(ift_l11)),title('IFFT l11','FontName','Times New Roman','FontSize',14); 
grid
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 14;
xlabel('Muestras','Interpreter','latex','FontSize',14)
ylabel('Potencia (W)','FontSize',14)
xlim([3000 8000])
subplot(3,2,3)
hold on
plot(ifftshift(ift_l11))
plot(ifftshift(ift_o11))
hold off
lgd = legend('l11', 'o11')
lgd.FontSize = 14;
lgd.FontName = 'Times New Roman'
title('IFFT o11','FontName','Times New Roman','FontSize',14); 
grid
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 14;
xlabel('Muestras','Interpreter','latex','FontSize',14)
ylabel('Potencia (W)','FontSize',14)
xlim([3000 8000])
subplot(3,2,5)
plot(ifftshift(ift_rho_air_1)),title('IFFT \Gamma_{1 Aire}','FontName','Times New Roman','FontSize',14);
grid
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 14;
xlabel('Muestras','Interpreter','latex','FontSize',14)
ylabel('Potencia (W)','FontSize',14)
xlim([3000 8000])
subplot(3,2,2)
plot(ifftshift(ift_l22)),title('IFFT l22','FontName','Times New Roman','FontSize',14); 
grid
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 14;
xlabel('Muestras','Interpreter','latex','FontSize',14)
ylabel('Potencia (W)','FontSize',14)
xlim([3000 8000])
subplot(3,2,4)
hold on
plot(ifftshift(ift_l22)),title('IFFT l22'); 
plot(ifftshift(ift_t11)),title('IFFT t11'); 
hold off
lgd = legend('l22', 't11')
lgd.FontSize = 14;
lgd.FontName = 'Times New Roman'
grid
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 14;
xlabel('Muestras','Interpreter','latex','FontSize',14)
ylabel('Potencia (W)','FontSize',14)
xlim([3000 8000])
subplot(3,2,6)
plot(ifftshift(ift_rho_air_2)),title('IFFT \Gamma_{2 Aire}','FontName','Times New Roman','FontSize',14);
grid
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 14;
xlabel('Muestras','Interpreter','latex','FontSize',14)
ylabel('Potencia (W)','FontSize',14)
xlim([3000 8000])

%% Calculamos le resto de coeficientes siguiendo ecuaciones del artículo
% Definición de ecuación (12), de la que nos quedamos con la raiz con
% abs(O22)<=1
pol=zeros(3,length(f));
pol(1,:)=rho_metal_2.*AA.*AA.*(rho_metal_1-rho_air_1);
pol(2,:)=rho_metal_1.*rho_metal_2.*AA.*AA-rho_air_1.*rho_metal_2.*AA+rho_air_2.*rho_metal_1.*AA;
pol(3,:)=rho_air_2.*rho_metal_1.*AA;

for k=1:length(f)
   root=roots(pol(:,k));
   o22(1,k)=root(2); 
   if abs(o22(1,k))>1
       o22(1,k)=root(1);
   end
end

t22=-1*rho_air_1./(o22.*AA.*(rho_metal_1-rho_air_1)+rho_metal_1.*AA); %Ecuación 11

o21=complexsqrt(-1*rho_metal_1.*(1+o22));
o12=o21;

t21=complexsqrt(-1*rho_metal_2.*(1+t22));
t12=t21;

%% CHINOS 

% y1=rho_metal_1;
% y2=rho_metal_2;
% y3=rho_air_1;
% y4=rho_air_2;
% e=AA;
% 
% t21=sqrt(y1.*y2.*(y4-e.*y2).*(e.*y1.*y2-y1.*y4-y2.*y3))./(e.*y1.*y2-y1.*y4); t12=t21;
% o21=sqrt(y1.*y2.*(y3-e.*y1).*(e.*y1.*y2-y1.*y4-y2.*y3))./(e.*y1.*y2-y2.*y3); o12=o21;
% o22=-1*(y1.*y4)./(y2.*(e.*y1-y3));
% t22=-1*(y2.*y3)./(y1.*(e.*y2-y4));
% 
% o21=abs(o21).*exp(1i*2*pi*f*(t(t1)/2-1*d/(2*c)));
% o12=o21;
% t21=abs(t21).*exp(1i*2*pi*f*(t(t2)/2-1*d/(2*c))); 
% t12=t21;

% o11=abs(o22).*exp(1i*2*pi*f*(t(t1)/2-d/(2*c)));
% o22=abs(o22).*exp(1i*2*pi*f*(t(t1)/2-d/(2*c)));
% t22=abs(t22).*exp(1i*2*pi*f*(t(t2)/2-d/(2*c)));
% t11=abs(t11).*exp(1i*2*pi*f*(t(t2)/2-d/(2*c))); 

%% Matrices de deembeding, 
O=zeros(2,2,length(f)); Ot=O; 
T=zeros(2,2,length(f)); Tt=T; 
O(1,1,:)=o11; O(1,2,:)=o12; O(2,1,:)=o21; O(2,2,:)=o22;
T(1,1,:)=t22; T(1,2,:)=t12; T(2,1,:)=t21; T(2,2,:)=t11; % Ojo, T está  definida al revés en el artículo!!

%% Bipuertos error a parámetros S
O=sparameters(O,f,Zref);
T=sparameters(T,f,Zref);

%% Transformación a parámetros ABCD para hacer productos de matrices
Ot=s2abcd(O.Parameters,Zref);
Tt=s2abcd(T.Parameters,Zref);
mutt=s2abcd(mut.Parameters,Zref);

% Preparación de objetos de resultados de calibración
resultado=zeros(2,2,length(f)); 

for k=1:length(f)
    resultado(:,:,k)=abcd2s(Ot(:,:,k)\mutt(:,:,k)/Tt(:,:,k),Zref);
    % Correción fase de S21 y S12 
%       resultado(2,1,k)=resultado(2,1,k).*exp(1i*2*pi*f(k)*1*(t(t1)-t(p1)+t(t2)-t(p2)));
%       resultado(1,2,k)=resultado(1,2,k).*exp(1i*2*pi*f(k)*1*(t(t2)-t(p2)+t(t1)-t(p1)));
%       resultado(1,1,k)=resultado(1,1,k).*exp(1i*2*pi*f(k)*1*(t(t1)-t(p1)+t(t2)-t(p2)));
%       resultado(2,2,k)=resultado(2,2,k).*exp(1i*2*pi*f(k)*1*(t(t2)-t(p2)+t(t1)-t(p1)));
    % Correción de fase si la longitud de la muestra es menor que la del
    % corto
%     if (sample<d)
%         resultado(2,1,k)=resultado(2,1,k).*exp(-1i*2*pi*f(k)*((d-sample)/c));
%         resultado(1,2,k)=resultado(1,2,k).*exp(-1i*2*pi*f(k)*((d-sample)/c));
%         resultado(2,2,k)=resultado(2,2,k).*exp(-1i*2*pi*f(k)*2*((d-sample)/c));
%     end
end

cal=sparameters(resultado,f,Zref);
figure(3);
rfplot(cal);
figure(4); 
rfplot(cal,"angle");

end
