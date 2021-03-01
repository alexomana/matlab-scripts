%% AEE final exam section one
clear all;
close all;
clc;

%% Open data file
fid=fopen('drive.CSV');

%% Read data in from CSV file
readHeader=textscan(fid,'%s %s %s',2,'HeaderLines',0,'Delimiter',',');
readData=textscan(fid,'%f %f %f','Delimiter',',');

%% Extract data from readData
vData=readData{1,1}(:,1);
iData=readData{1,2}(:,1);

%%
N=length(vData);
t=linspace(-5,5,N);

Vrms=rms(vData);
Irms=rms(iData);

%% Average Power [W]
P=abs(mean(vData.*iData))