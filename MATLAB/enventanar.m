function y=enventanar(x,p,l)
%function y=enventanar(x,p,l)
%Enventana una señal x, centrada en p, con una ventana Hann de longitud l
aux=[x(ceil(length(x)/2)+1:end) x(1:ceil(length(x)/2))];

w=hann(l)';
y=zeros(1,length(x));
y(p-0.5*(l-1):p+0.5*(l-1))=aux(p-0.5*(l-1):p+0.5*(l-1)).*w;

y=[y(ceil(length(x)/2):end) y(1:floor(length(x)/2))];

end