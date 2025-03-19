function representacion_Spar_time_ventana_tomas(d,d1,Spar_time, Spar_time1, delta_d, nombre, ventana,Peakimax,Dmax)

figure('Name', nombre + " NO TG + window",'Position', [0, 0, 850, 300])
plot(d1*1e3,fftshift(Spar_time(:,1)),'LineWidth',2)
hold on
plot(d1*1e3,ventana*max(Spar_time(:,1))*3/2,'LineWidth',2)
hold off
xlabel('Distancia (mm)')
ylabel('Potencia [W]')
xlim([-570 570])
ylim([-0.07 0.09])
%ylim([min(Spar_time1(:,1))*3/2 max(Spar_time1(:,1))*3/2])
grid
ejes = gca;
ejes.FontName = 'Times New Roman'
ejes.FontSize = 14;
lgd = legend('S_{11}','Ventana de Hanning');
lgd.FontSize = 14;
lgd.FontName = 'Times New Roman'


% 
% plot(d1*1e3,Spar_time1(:,1),'LineWidth',2)
% hold on
% plot(d1*1e3,ventana*max(Spar_time1(:,1))*3/2,'LineWidth',2)
% hold off
% xlabel('Distancia (mm)')
% ylabel('Potencia [W]')
% xlim([-570 570])
% ylim([-0.07 0.09])
% %ylim([min(Spar_time1(:,1))*3/2 max(Spar_time1(:,1))*3/2])
% grid
% ejes = gca;
% ejes.FontName = 'Times New Roman'
% ejes.FontSize = 14;
% lgd = legend('S_{11}','Ventana de Hanning');
% lgd.FontSize = 14;
% lgd.FontName = 'Times New Roman'

end