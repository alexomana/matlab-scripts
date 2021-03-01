%Script de prueba de calculos electricos
% Hecho por: Elvis Tek
%Fecha: 17.10.19
%Version 1.0 (para cuando se comparta en GitHub)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
clear variables
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format long g %numero exacto y no en notacion cientifica %short para reducir
f=60; %Operating frequency
w=2*pi*f; %Angular speed
vm=311; %Peak voltage (Amplitude)
t=linspace(-5,5,200);
v=vm*sin(w*t+pi/2);
a=length(v); % cuantos valores tiene el vector
b=v.^2; 
c=sum(b)
vrms=sqrt(c/a)

%r=10; %resistance
%i=v/r;
%p=v.*i;
%figure(1);
%hold on
%grid on
%plot(t,v,'g--o')
%plot(t,i,'r--o')
%plot(t,p,'m--o')
%xlabel('Time');
%ylabel('Signal amplitude');
%title('AC V-I plot on a resistive load');

