function representacion_Spar_time_ventana(d,d1,Spar_time, Spar_time1, delta_d, nombre, ventana,Peakimax,Dmax)
ventanaa=ventana;    
figure('Name', nombre + " NO TG + window")
ii=1;

salida=['ABS(Ifft(S11)) shift';'ABS(Ifft(S21)) shift';'ABS(Ifft(S12)) shift';'ABS(Ifft(S22)) shift'];

for i=1:size(Spar_time,2)
    subplot(4,3,ii)
    plot(d1*1e3,fftshift(Spar_time(:,i)))
    hold on
    plot(d1*1e3,ventana*max(Spar_time(:,i))*3/2)
    hold off
    xlabel('Distance (mm)')
    ylabel('Amplitude')
    xlim([-Dmax Dmax])
    ylim([min(Spar_time1(:,i))*3/2 max(Spar_time1(:,i))*3/2])
    title(salida(i,:))
    ii=ii+1;
    subplot(4,3,ii)
    plot(d1*1e3,Spar_time1(:,i))
    hold on
    plot(d1*1e3,ventana*max(Spar_time1(:,i))*3/2)
    hold off
    xlabel('Distance (mm)')
    ylabel('Amplitude')
    xlim([-Dmax Dmax])
    ylim([min(Spar_time1(:,i))*3/2 max(Spar_time1(:,i))*3/2])
    title(salida(i,:))
    ii=ii+1;
    subplot(4,3,ii)
    plot(d*1e3,ifftshift(Spar_time1(:,i)))
    xlabel('Distance (mm)')
    ylabel('Amplitude')
    xlim([0 Dmax])
    ylim([min(Spar_time1(:,i))*3/2 max(Spar_time1(:,i))*3/2])
    title(salida(i,:))

    ii=ii+1;
end



    
end