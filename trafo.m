%% .m file for analysis of a square wave
clear all;
clc;
close all;

%% Square Wave Generation
t=linspace(0,10,200);
f=60;
w=2*pi*f;
Vmax=350;
V=Vmax*sin(w*t)+Vmax/16*sin(5*w*t)+Vmax/34*sin(13*w*t);
Vrms=rms(V);
z=7.09;
V1=Vmax*sin(w*t);
I=V/z;
Irms=rms(I);
Vd=Vmax/16*sin(5*w*t)+Vmax/34*sin(13*w*t);


%%
I1=V1/z;
I1rms=rms(I1)

%% Average Power [W]
N=length(V);
P=rms(dot(V,I1)/N)
%%
%dispPF=P/(Vrms*I1rms)

%%
%% Distortion Power Factor
distPF=I1rms/Irms

PF=distPF*0.97

%% Total Harmonic Distortion

Id=Vd/z;
Idrms=rms(Id);
THD= (Idrms/I1rms)*100
Il=1500;
TDD=(Idrms/Il)*100
