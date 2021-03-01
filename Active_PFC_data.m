%% Power Factor Correction (PFC) Continuous Conduction Mode Boost Converter
%This example shows how to correct the power factor using a PFC 
%preconverter. This technique is useful when non-linear impedances, such ass
%Switch Mode Power Supplies are connected to an AC grid. As the current 
%flowing through the inductor is never zero during the switching cycle, the
%boost converter operates in Continuous Conduction Mode (CCM). The inductor
%current and the ouput voltage profiles are controlled using simple 
%integral control. During startup, the reference output voltage is ramped 
%up to the desired voltage.
%
% Copyright 2018 The MathWorks, Inc.
clc;
clear all;
%% Design Parameters                         
Line_Voltage_Peak   = 120*sqrt(2);                  %  Input Voltage Peak to the Full Bridge Rectifier [V]
f_line              = 60;                           %  Power line frequency [Hz]
Voref               = 400;                          %  Desired Output Voltage from PFC Preconverter [V]
Power               = 1e3;                          %  Maximum steady state power capability [W]
R                   = 200;                          %  Arbitrary resistive load [Ohms]
del_V               = 10;                           %  Peak-Peak Output Voltage Ripple [V]
IndCurrRipple       = 8;                            %  Inductor Current Ripple [%]
Conv_efficiency     = 92;                           %  Nominal efficiency of the preconverter [%]
f_sw                = 50e3;                         %  MOSFET Switching Frequency [Hz] 
Ts                  = 1/(100*f_sw);                 %  Sampling time for the plant [sec]
Tsc                 = 1/(50*f_sw);                  %  Sampling time for the controller [sec]
t_holdup            = 16.6e-3;                      %  Minimum hold up time for a minimum output voltage of 340V [sec]
I_Kp                = 0.15;                         %  Proportional Gain of the Inner Current Loop contoller
I_Ki                = 15;                           %  Integral Gain of the Inner Current Loop contoller
V_Kp                = 0.01;                         %  Proportional Gain of the Outer Voltage Loop contoller
V_Ki                = 10;                           %  Integral Gain of the Outer Voltage Loop contoller

%% Converter Design

Duty = (Voref-Line_Voltage_Peak)/Voref;
I_in_peakmax = 2*(Power/(Conv_efficiency*0.01))/Line_Voltage_Peak;

%% Filter Inductance

del_I = (IndCurrRipple/100)*I_in_peakmax;
L = (Line_Voltage_Peak*Duty)/(f_sw*del_I);

%% Filter Capacitance

C = max((2*Power*t_holdup)/((Voref)^2-340^2),Power/(2*pi*f_line*del_V*Voref));

%EOF