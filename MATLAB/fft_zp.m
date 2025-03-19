function [f,y]=fft_zp(x,sp)
% y=fft_zp(x)
% Recibe vector en tiempo y objeto de parámetros S y devuelve al dominio de
% la frecuencia original (y) y vector de frecuencias (f)

N=length(sp.Frequencies);
fmin=sp.Frequencies(1);
fmax=sp.Frequencies(N);

fs=fmax-fmin;
dt=1/fs;
df=1/((N-1)*dt);
f=(0:N-1)*df+fmin;

tf=fft(x);

L=length(tf);

y=tf(ceil(L/2)-N+1:ceil(L/2));

end