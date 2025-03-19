function representacion_Spar_Frec_Tg_no_tg(F,Spar_frec_filtrados, Spar, Fmin, Fmax, DBmin, DBmax, Pmin, Pmax, nombre)

    figure('Name', nombre)
    subplot(4,2,1)
    plot(F*1e-9,20*log10(abs(Spar_frec_filtrados(:,1))),'r','LineWidth',2,'LineStyle','-')
    hold on
    plot(F*1e-9,20*log10(abs(Spar(:,1))),'b','LineWidth',0.5,'LineStyle','-')
    lgd = legend('TG','No TG');
    lgd.FontSize = 14;
    xlabel('Frequency (GHz)','Interpreter','latex')
    ylabel('Amplitude norm. [dB]','Interpreter','latex')
    title('S11')
    grid on
    xlim([Fmin Fmax])
    ylim([DBmin DBmax])
    subplot(4,2,2)
    plot(F*1e-9,wrapTo180(rad2deg(angle(Spar_frec_filtrados(:,1)))),'r','LineWidth',2,'LineStyle','-')
    hold on
    plot(F*1e-9,wrapTo180(rad2deg(angle(Spar(:,1)))),'b','LineWidth',0.5,'LineStyle','-')
    lgd = legend('TG','No TG');
    lgd.FontSize = 14;
    xlabel('Frequency (GHz)','Interpreter','latex')
    ylabel('Phase [º]','Interpreter','latex')
    title('S11')
    grid on
    xlim([Fmin Fmax])
    ylim([Pmin Pmax])

    subplot(4,2,3)
    plot(F*1e-9,20*log10(abs(Spar_frec_filtrados(:,3))),'r','LineWidth',2,'LineStyle','-')
    hold on
    plot(F*1e-9,20*log10(abs(Spar(:,3))),'b','LineWidth',0.5,'LineStyle','-')
    lgd = legend('TG','No TG');
    lgd.FontSize = 14;
    xlabel('Frequency (GHz)','Interpreter','latex')
    ylabel('Amplitude norm. [dB]','Interpreter','latex')
    title('S21')
    grid on
    xlim([Fmin Fmax])
    ylim([DBmin DBmax])
    subplot(4,2,4)
    plot(F*1e-9,wrapTo180(rad2deg(angle(Spar_frec_filtrados(:,3)))),'r','LineWidth',2,'LineStyle','-')
    hold on
    plot(F*1e-9,wrapTo180(rad2deg(angle(Spar(:,3)))),'b','LineWidth',0.5,'LineStyle','-')
    lgd = legend('TG','No TG');
    lgd.FontSize = 14;
    xlabel('Frequency (GHz)','Interpreter','latex')
    ylabel('Phase [º]','Interpreter','latex')
    title('S21')
    grid on
    xlim([Fmin Fmax])
    ylim([Pmin Pmax])

    subplot(4,2,5)
    plot(F*1e-9,20*log10(abs(Spar_frec_filtrados(:,2))),'r','LineWidth',2,'LineStyle','-')
    hold on
    plot(F*1e-9,20*log10(abs(Spar(:,2))),'b','LineWidth',0.5,'LineStyle','-')
    lgd = legend('TG','No TG');
    lgd.FontSize = 14;
    xlabel('Frequency (GHz)','Interpreter','latex')
    ylabel('Amplitude norm. [dB]','Interpreter','latex')
    title('S12')
    grid on
    xlim([Fmin Fmax])
    ylim([DBmin DBmax])
    subplot(4,2,6)
    plot(F*1e-9,wrapTo180(rad2deg(angle(Spar_frec_filtrados(:,2)))),'r','LineWidth',2,'LineStyle','-')
    hold on
    plot(F*1e-9,wrapTo180(rad2deg(angle(Spar(:,2)))),'b','LineWidth',0.5,'LineStyle','-')
    lgd = legend('TG','No TG');
    lgd.FontSize = 14;
    xlabel('Frequency (GHz)','Interpreter','latex')
    ylabel('Phase [º]','Interpreter','latex')
    title('S12')
    grid on
    xlim([Fmin Fmax])
    ylim([Pmin Pmax])

    subplot(4,2,7)
    plot(F*1e-9,20*log10(abs(Spar_frec_filtrados(:,4))),'r','LineWidth',2,'LineStyle','-')
    hold on
    plot(F*1e-9,20*log10(abs(Spar(:,4))),'b','LineWidth',0.5,'LineStyle','-')
    lgd = legend('TG','No TG');
    lgd.FontSize = 14;
    xlabel('Frequency (GHz)','Interpreter','latex')
    ylabel('Amplitude norm. [dB]','Interpreter','latex')
    title('S22')
    grid on
    xlim([Fmin Fmax])
    ylim([DBmin DBmax])
    subplot(4,2,8)
    plot(F*1e-9,wrapTo180(rad2deg(angle(Spar_frec_filtrados(:,4)))),'r','LineWidth',2,'LineStyle','-')
    hold on
    plot(F*1e-9,wrapTo180(rad2deg(angle(Spar(:,4)))),'b','LineWidth',0.5,'LineStyle','-')
    lgd = legend('TG','No TG');
    lgd.FontSize = 14;
    xlabel('Frequency (GHz)','Interpreter','latex')
    ylabel('Phase [º]','Interpreter','latex')
    title('S22')
    grid on
    xlim([Fmin Fmax])
    ylim([Pmin Pmax])
    
end