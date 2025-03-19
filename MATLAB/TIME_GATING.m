function [Spar_frec_filtrados] = TIME_GATING(delta_d, d,F,Spar, N_hann, Spar_tiempo, relleno, DBmin, DBmax, Pmin, Pmax, Dmin, Dmax, nombre);

Fmin = F(1)*1e-9;
Fmax = F(end)*1e-9;

d1=d-d(length(d)/2+1);

[valor_S21,Peakimax_S21]=max(fftshift(Spar_tiempo(:,2)));
[valor_S11,Peakimax_S11]=max(fftshift(Spar_tiempo(:,1)));

if valor_S21>=valor_S11
    Peakimax = Peakimax_S21;
else
    Peakimax = Peakimax_S11;
end

% Hacemos la venta Han con una convolucion (nuevo)
Han = rectwin(N_hann+1);      % Ventana rectangular
Han=hann(N_hann+1)';

delta= zeros(1,length(Spar_tiempo(:,3)));
delta(Peakimax-N_hann/2)=1;

ventana_desplazada= conv(delta,Han);
ventana=ventana_desplazada(1,1:length(ventana_desplazada)-N_hann);


if N_hann == 0
ventana = delta
end

[a,b]=size(Spar);
Spar_frec_filtrados=zeros(length(Spar(:,1)),b);
Spar_time2=zeros(length([relleno transpose(Spar(:,1))])*2,b);


for i=1:b
    Spar_tiempo2(:,i) = fftshift(Spar_tiempo(:,i)) .* ventana';
    Spar_frec = fft(ifftshift(Spar_tiempo2(:,i)));
    S21_final = Spar_frec(length(relleno)+1:length(relleno)+length(Spar));
    Spar_frec_filtrados(:,i) = S21_final;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
representacion_Spar_time_ventana(d,d1, Spar_tiempo, Spar_tiempo2 , delta_d, nombre, ventana,Peakimax_S21,Dmax)
representacion_Spar_time_ventana_tomas(d,d1, Spar_tiempo, Spar_tiempo2 , delta_d, nombre, ventana,Peakimax_S21,Dmax)
representacion_Spar_Frec_Tg_no_tg(F,Spar_frec_filtrados, Spar, Fmin, Fmax, DBmin, DBmax, Pmin, Pmax, nombre)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



end

