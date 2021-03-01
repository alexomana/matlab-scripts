%%
clc;
clear all;
close all;
%%
Am=4;%setring the sine wave amplitude
bit=3;% setting the number btis
f=1; %sine wave frequency
fs=30;% setting sampling frequency
t=0:1/fs:1*pi; %defining the signal duration for plotting
y=Am*sin(2*pi*f*t); %ssampled sine wave y(30 samples in a cycle)
Nsamples=length(y); %calculating the total number of samples
quantised_out=zeros(1,Nsamples); %making an array of size=number of samples
%midrise
del=2*Am/(2^bit); %determinig the step size
Llow=-Am+del/2;
Lhigh=Am-del/2;

for i=Llow:del:Lhigh %Iterating from lowest to the highest levels

    for j=1:Nsamples %taking the whole sampled vector
     if(((i-del/2)<y(j))&&(y(j)<(i+del/2)))        % Quantizing the sampled value 
        quantised_out(j)=i;                        % to the quantization level if it 
  
     end                               % lies within the bound of -del/2 and
    end                                % del/2 of the level.
end
stem(t,quantised_out); %plotting wave forms.
hold on;
plot(t,y,'color','r');
