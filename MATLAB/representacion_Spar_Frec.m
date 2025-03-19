function representacion_Spar_Frec(F, Spar, DBmin, DBmax, nombre)

    figure('Name', nombre,'Position', [0, 0, 850, 500])    
    plot(F*1e-9,20*log10(abs(Spar(:,1))),'b','LineWidth',2,'LineStyle','-')
    hold on
    plot(F*1e-9,20*log10(abs(Spar(:,2))),'r','LineWidth',2,'LineStyle','-')
    plot(F*1e-9,20*log10(abs(Spar(:,3))),'c','LineWidth',2,'LineStyle','-')
    plot(F*1e-9,20*log10(abs(Spar(:,4))),'m','LineWidth',2,'LineStyle','-')
    hold off
    
    lgd = legend('S11','S21','S12','S22');
    lgd.FontSize = 14;
    lgd.FontName = 'Times New Roman'
    xlabel('Frecuencia (GHz)','Interpreter','latex')
    ylabel('Amplitud norm. [dB]','Interpreter','latex')
    ejes = gca;
    ejes.FontName = 'Times New Roman'
    ejes.FontSize = 14;
    xlim([F(1)*1e-9 F(end)*1e-9])
    %     title('S11')
    grid
%     xlim([Fmin Fmax])
    ylim([DBmin DBmax])
    
end