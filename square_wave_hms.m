%% .m file for analysis of a square wave
clear all;
clc;
close all;

%% Square Wave Generation
t=linspace(0,10,200);
f=60;
w=2*pi*f;
i=zeros(size(t));
for k=1:1:1000              %number of harmonics
n=2*k-1;                    %odd numbers sequence
i=i+4/pi*(sin(n*w*t)/n);    %fourier series
end

%% Square Wave Graph
plot(t,i)
grid on

%% Fundamental Component
k=1                         %number of harmonics
n=2*k-1;                    %odd numbers sequence
i1=4/pi*(sin(n*w*t)/n);     %fourier series of fundamental component

%% Distortion Components
id=zeros(size(t));
for k=2:1:1000              %number of harmonics
n=2*k-1;                    %odd numbers sequence
id=id+4/pi*(sin(n*w*t)/n);  %fourier series of distortion components
end

%% RMS Voltage [V]
Vrms=rms(vData)

%% RMS Current [A]
Irms=rms(i)

%% Average Power [W]
N1=length(i1);
%P=mean(dot(vData,i1)) P=rms(dot(vData,i1)/N1) P=abs(mean(vData.*i1))

%% Displacement Power Factor P=Vrms*y1rms*cos(theta1)
I1rms=rms(i1);
dispPF=P/(Vrms*I1rms)

%% Distortion Power Factor
distPF=I1rms/Irms

%% Total Power Factor
PF=distPF*dispPF

%% Total Harmonic Distortion
Idrms=rms(id);
THD= (Idrms/I1rms)*100;

%% Total Demand Distortion
TDD=(Idrms/Irmsloadmax)*100