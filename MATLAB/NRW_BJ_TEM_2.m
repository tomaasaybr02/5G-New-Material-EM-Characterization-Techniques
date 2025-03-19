function [n,permeabillity,permittivity,Z] = NRW_BJ_TEM_2(Spar_sample,Spar_air,freq,c,L,Lair,NN)
%FUNCIONA
format long
Fmin = freq(1)*1e-9;
Fmax = freq(end)*1e-9;
%passage au GHz
w = 2*pi*freq;
gamma_1 = 1i* w/c;

S11 = Spar_sample(:,1);
S21 = Spar_sample(:,3);
S12 = Spar_sample(:,2);
S22 = Spar_sample(:,4);
S21_o = Spar_air(:,3);
S12_o = Spar_air(:,2);

A = S11.*S22./(S21.*S12);
B = exp(2*gamma_1.*(Lair-L)).*(S21.*S12-S11.*S22);
GAMMASQRTMOINS= (-A.*(1+B.^2)+(1-B).^2)./(2.*A.*B)-(sqrt((-4.*A.^2.*B.^2)+(A.*(1+B.^2)-(1-B).^2).^2))./(2.*A.*B);
GAMMASQRTPLUS= (-A.*(1+B.^2)+(1-B).^2)./(2.*A.*B)+(sqrt((-4.*A.^2.*B.^2)+(A.*(1+B.^2)-(1-B).^2).^2))./(2.*A.*B);
GAMMAMOINS=sqrt(GAMMASQRTMOINS);
GAMMAPLUS=sqrt(GAMMASQRTPLUS);
GAMMAMOINS = GAMMAMOINS.*(abs(GAMMAMOINS)<1);
GAMMAPLUS = GAMMAPLUS.*(abs(GAMMAPLUS)<1);
GAMMA = GAMMAMOINS + GAMMAPLUS;
GAMMASQRT=GAMMA.^2;
% GAMMASQRT=GAMMASQRTMOINS.*(abs(GAMMASQRTMOINS)<1)+GAMMASQRTPLUS.*(abs(GAMMASQRTPLUS)<1);
% GAMMA=1*complexsqrt(GAMMASQRT);
R = S21./S21_o;
P=R.*(1+GAMMASQRT)./(1+B.*GAMMASQRT).*exp(-gamma_1.*L);
NUEVA= log(abs(1./P)) + 1j.*(unwrap(angle(1./P)) + 2*NN*pi);
n=((1./(gamma_1.*L)).*NUEVA);
Z=(1-GAMMA)./(1+GAMMA);
permeabillity=(n.*Z);
permittivity=(n./Z);
end