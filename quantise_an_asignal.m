clear all
clc
close all

%%Use this function to quantize an analog sinusoidal signal with N=4 and 32 levels. Compute the SQR for each level.
t=0:.001:2; 
y=2*sin(2*pi*t);
figure(1);
subplot(3,1,1);
plot(y)
q1=uquant(y,4);
subplot(3,1,2);
plot(q1)
q2=uquant(y,32);
subplot(3,1,3);
plot(q2)
Ps=mean(y.^2); 
Pq1=mean(q1.^2); 
Pq2=mean(q2.^2); 
SQR1=Ps/Pq1; 
SQR2=Ps/Pq2;

%% Write a Matlab function Y = uquant(X,N) which will uniformly quantize an input array X (either a vector or a matrix) to N discrete levels.
function y=uquant(x,n); del=((max(max(x))-(min(min(x)))))/(n-1); r=(x-min(min(x)))/del;
r=round(r);
y=r*del+min(min(x));
end