function [Spar_time, delta_d,d,relleno,Dmax] = IFFT(c_vel,Freq, Spar, Dmin, nombre,variable_FFT)

format long


FrecStart = Freq(1);
FrecStop = Freq(end);
FrecStep = Freq(2) - Freq(1);

relleno = zeros(1,round(FrecStart/FrecStep));

f=0:FrecStep:FrecStop;

[a,b]=size(Spar);
Spar_time=zeros(length([relleno transpose(Spar(:,1))])*2,b);

% S11_time=Spar_time(:,1) S12_time=Spar_time(:,2) S21_time=Spar_time(:,3) S22_time=Spar_time(:,4)
for i=1:b
    signal_rellena = [relleno transpose(Spar(:,i))];
    signal_formada = [0 conj(signal_rellena(end:-1:2)) signal_rellena]; %combiamos el complejo conjugado con la señal original
    Spar_time(:,i) = ifft(fftshift(signal_formada),'symmetric'); %Pasamos al dominio del tiempo
end

[a,Peakimax]=max((Spar_time(:,2)));

Fs=2*Freq(end);
delta_t = 1/(Fs);
t = [0:delta_t:(length(Spar_time(:,1))-1)*delta_t];
delta_d = delta_t*c_vel; %[m]
d = t*c_vel;
f2=((-length(signal_rellena))*FrecStep):FrecStep:(length(signal_rellena)-1)*FrecStep;
f3=[f [((-length(signal_rellena))*FrecStep):FrecStep:-FrecStep]];

Dmax=Peakimax*delta_d*1e3*2;


%Para representar los pasos de la IFFT
if variable_FFT==1
    figure('Name', nombre + "_frec_preparacion_IFFT")
    subplot(3,1,1)
    plot(f*10^-9,(signal_rellena))
    xlabel('Freq (GHz)')
    ylabel('Amplitude')
    xlim([f(1)*10^-9 f(end)*10^-9])
    ylim([0 max(abs(signal_rellena))*3/2])
    title('ABS(signal rellena(S11))')
    subplot(3,1,2)
    plot(f2*10^-9,abs(signal_formada))
    xlabel('Freq (GHz)')
    ylabel('Amplitude')
    xlim([f2(1)*10^-9 f2(end)*10^-9])
    ylim([0 max(abs(signal_formada))*3/2])
    title('ABS(signal duplicada conjugada ( -pi,pi )(S11))')
    subplot(3,1,3)
    plot(abs(ifftshift(signal_formada)))
    xlabel('muestras')
    ylabel('Amplitude')
    ylim([min(signal_formada)*3/2 max(signal_formada)*3/2])
    title('ABS(signal duplicada conjugada ( 0,2pi )(S11))')
end

representacion_Spar_time(d, Spar_time, Dmin, Dmax, delta_d, nombre)

end

