
function [ y, r, c ] = spwm( f1, fc, varargin )
%SPWM Generates sine-wave modulated bipolar PWM.
%   Will produce the closest possible to a single period of f1.
%   [ y, t, c ] = spwm( f1, fc, varargin )
%
%   f1          Base harmonic frequency.
%   fc          Carrier frequency.
%   'NSamples'  [100] Samples per 1/fc period.
%   'Method'    ['left'] 'left', 'right' or 'center'.
%   'ModIndex'  [1] Modulation index.
%   'OutAmpl'   [0.5] Output PWM amplitude.
%   'ThiPWM'    [false] Enable third harmonic injection
%   'Unipolar'  [false] Enable unipolar signal.
%   'Phase'     [0] Phase offset (rad)
%
%   y           PWM Signal.
%   r           Reference sine wave used.
%   c           Carrier wave.
% Parse input
fc=180;
f1=60;
p = inputParser;

defltMethod = 'center';
validMethod = {'left','center','right'};
checkMethod = @(x) any(validatestring(x,validMethod));

p.addOptional('NSamples', 100, @isnumeric);
p.addOptional('ModIndex', 1, @isnumeric);
p.addOptional('Method', defltMethod, checkMethod);
p.addOptional('ThiPWM', false, @islogical);
p.addOptional('Unipolar', false, @islogical);
p.addOptional('OutAmpl', 0.5, @isnumeric);
p.addOptional('Phase', 0, @isnumeric);

p.parse(varargin{:});

% Get if THIPWM is enabled
thipwm = p.Results.ThiPWM;
method = p.Results.Method;

% Get samples per period
n = p.Results.NSamples;

% Define counter based on method
switch method
    case 'left'
        u = linspace(-1, 1, n);
    case 'right'
        u = linspace(1, -1, n);
    case 'center'                        
        u = linspace(1, -1, ceil(n/2 + 1));
        u = [linspace(u(end-1), u(2), floor(n/2 - 1)) u];
    otherwise
        error('Please supply a valid method')
end
  
% Amounnt of carrier cycles
q = ceil(fc/f1);
% Output signal amplitude: -1/2 to 1/2
k = p.Results.OutAmpl;
% Offset if signal is unipolar
o = (k)*p.Results.Unipolar;
% Carrier wave with unit amplitude
%c = (1/p.Results.ModIndex)*repmat(u, 1, q);
c = repmat(u, 1, q);
% Frequency input
%w = (2*pi/(q*n))*(1:(q*n));
w = linspace(0, 2*pi, q*n);
% Reference signal, in the -1/2 to 1/2 range
if ~thipwm   
    r = sin(w + p.Results.Phase);
else    
    r = (2/sqrt(3))*(sin(w + p.Results.Phase) + (1/6)*sin(3*w));
end    
% Set reference waveform's amplitude to produce desired ModIndex
r = r*(p.Results.ModIndex);
% Use definition, but fix cases where r-c = 0, and sign = 0
y = k*(sign(r-c) + (sign(r).*((r-c)==0))) + o; 
% Update output waveforms
r = k*r + o;
c = k*c + o;
plot(c)
end