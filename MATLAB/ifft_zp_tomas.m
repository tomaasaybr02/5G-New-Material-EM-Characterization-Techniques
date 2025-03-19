function [t,y]=ifft_zp_tomas(r,freq)
% function y=ifft_zp(sp)
% Recibe objeto de parámetros s y devuelve la IFFT (y) y el vector temporal
% (t)
% m y n indican el índice (p.ej. S11 -> m=1, n=1)

N=length(freq);
fmin=freq(1);
fmax=freq(N);

fs=fmax-fmin;
dt=1/fs;
df=1/((N-1)*dt);

relleno=zeros(1,floor(fmin/df)+1); % Añade ceros, desde 0 a fmin

dt=1/(2*fmax);
t=(-1*(N+length(relleno)-1):(N+length(relleno)-1))*dt; % Para enventanar

vectorbb=[relleno r];
vectorconj=[vectorbb, fliplr(conj(vectorbb(2:end)))];

y=(ifft(vectorconj,'symmetric'));

end