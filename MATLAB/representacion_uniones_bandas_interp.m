function representacion_uniones_bandas_interp(freq, ep_real, ep_imag,ep_interp, mu_real, mu_imag, mu_interp, n2, amp_max_n2, amp_min_n2, ...
    amp_max_mu, amp_min_mu, amp_max_ep, amp_min_ep,nombre)
    
    GHz=1e9;
%     sombra_ini = 6727;
%     sombra_fin = 7237;
    freq = freq/GHz;
    sombra_y = zeros(length(freq),1); 
%     f_sombra_ini = freq(sombra_ini);
%     f_sombra_fin = freq(sombra_fin);
    
    %figure("Propiedades electromagnéticas" + nombre, 'Name')
    %figure('Position', [0, 0, 110, 50]); % Altura: 110, Ancho: 50
    figure('Name', nombre + ", propiedades electromagnéticas",'Position', [0, 0, 850, 300])   
    plot(freq,ep_real,'LineWidth',2);
    hold on
    plot(freq,ep_imag,'LineWidth',2,'LineStyle','--')
    plot(freq,ep_interp,'LineWidth',2);
    hold off
    ylim([amp_min_ep amp_max_ep])
    xlim([freq(1) freq(end)])
    lgd = legend('Real', 'Imaginaria', 'Interpolada')
    lgd.FontSize = 14;
    lgd.FontName = 'Times New Roman'
    xlabel('Frecuencia [GHz]','Interpreter','latex','FontSize',14)
    ylabel('\epsilon_r','FontSize',14)
    ejes = gca;
    ejes.FontName = 'Times New Roman'
    ejes.FontSize = 14;
    grid
    
    figure('Name', nombre + ", propiedades electromagnéticas",'Position', [0, 0, 850, 300])  
    plot(freq,mu_real,'LineWidth',2);
    hold on
    plot(freq,mu_imag,'LineWidth',2,'LineStyle','--')
    plot(freq,mu_interp,'LineWidth',2);
    hold off
    ylim([amp_min_mu amp_max_mu])
    xlim([freq(1) freq(end)])
    lgd = legend('Real', 'Imaginaria', 'Interpolada')
    lgd.FontSize = 14;
    lgd.FontName = 'Times New Roman'
    xlabel('Frecuencia [GHz]','Interpreter','latex','FontSize',14)
    ylabel('\mu_r','FontSize',14)
    %ylabel('\mu_r','Interpreter','latex')
    ejes = gca;
    ejes.FontName = 'Times New Roman';
    ejes.FontSize = 14;
    grid
    
    figure('Name', nombre + ", propiedades electromagnéticas",'Position', [0, 0, 850, 300])  
    plot(freq,n2,'LineWidth',2);
    ylim([amp_min_n2 amp_max_n2])
    xlim([freq(1) freq(end)])
    %xlim([30 52])
    xlabel('Frecuencia [GHz]','Interpreter','latex','FontSize',14)
    ylabel('n^2','FontSize',14)
    %ylabel('n^2','Interpreter','latex')
    ejes = gca;
    ejes.FontName = 'Times New Roman'
    ejes.FontSize = 14;
    grid
    %sgtitle(sprintf('NN =  %d', NN),'FontName','Times New Roman','FontWeight','bold','FontSize',14)


end