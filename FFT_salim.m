%XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
%XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX FFT Tuterial XXXXXXXXXXXXXXXXXXXXXXXXXX
%XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

clc
clear all
close all

%XXXXXXXXXXXXXXXXXXXXXXXXXXX FFT using general form XXXXXXXXXXXXXXXXXXXXXXX
mm=[];
A=10;
fs=1000;
Ts=1/fs;
t=(1:1000)*Ts;
y=10*sin(2*pi*200*t)+5*sin(2*pi*400*t)+12*sin(2*pi*300*t);
N=length(t);
for(k=1:N)
    for(n=1:N)
        y1(n)=y(n).*exp(-j*2*pi*((-N/2)+n-1)*((-N/2)+k-1)/N);
    end
    mm=[mm sum(y1)];
end
length(mm);
f=fs.*(-N/2:N/2-1)/N;
figure(1)
plot(f,2*abs(mm)/N);
title('Frequency spectrum for given signal without FFT biltin function');
xlabel('Frequency(Hz)');
ylabel('Amplitude(volt)');


%XXXXXXXXXXXXXXXXXXXXXXXXXX FFT with biltin function XXXXXXXXXXXXXXXXXXXXXX
mm=[];
A=10;
fs=1000;
Ts=1/fs;
t=(1:1000)*Ts;
y=10*sin(2*pi*200*t)+5*sin(2*pi*400*t)+12*sin(2*pi*300*t);
N=length(t);
N=length(t);
yy=fft(y);
yyy=fftshift(yy);
f=fs.*(-N/2:N/2-1)/N;
figure(2)
plot(f,(2*abs(yyy)/N));
title('Frequency spectrum for given signal with FFT biltin function (BF)');
xlabel('Frequency(Hz)');
ylabel('Amplitude(volt)');



%XXXXXXXXXXXXXXXXX FFT with biltin function and zero padding XXXXXXXXXXXXX
mm=[];
A=10;
fs=1000;
Ts=1/fs;
t=(1:1000)*Ts;
y=10*sin(2*pi*200*t)+5*sin(2*pi*400*t)+12*sin(2*pi*300*t);
N= 2^nextpow2(1000);
yy=fft(y,N);
yyy=fftshift(yy);
f=fs.*(-N/2:N/2-1)/N;
figure(3)
plot(f,(2*abs(yyy)/N));
title('Frequency spectrum for given signal with FFT(BF)and zero padding');
xlabel('Frequency(Hz)');
ylabel('Amplitude(volt)');


%XXXXXXXXXXXXXXXXXXXXXXXXXXX END XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX





















