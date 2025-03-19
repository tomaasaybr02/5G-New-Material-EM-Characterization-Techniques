function [t,y]=ifft_zp(sp,m,n)
% function y=ifft_zp(sp)
% Recibe objeto de parámetros s y devuelve la IFFT (y) y el vector temporal
% (t)
% m y n indican el índice (p.ej. S11 -> m=1, n=1)

N=length(sp.Frequencies);
fmin=sp.Frequencies(1);
fmax=sp.Frequencies(N);

s=sp.Parameters(m,n,:);
s=reshape(s,[1,N]);

fs=fmax-fmin;
dt=1/fs;
df=1/((N-1)*dt);

relleno=zeros(1,floor(fmin/df)+1); % Añade ceros, desde 0 a fmin

dt=1/(2*fmax);
t=(-1*(N+length(relleno)-1):(N+length(relleno)-1))*dt; % Para enventanar

vectorbb=[relleno s];
vectorconj=[vectorbb, fliplr(conj(vectorbb(2:end)))];

y=(ifft(vectorconj,'symmetric'));

end