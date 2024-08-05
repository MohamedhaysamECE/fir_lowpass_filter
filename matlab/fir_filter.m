function Hd = fir_filter
%FIR_FILTER Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.1 and the Signal Processing Toolbox 6.19.
% Generated on: 29-Jun-2024 19:13:35

% FIR Window Lowpass filter designed using the FIR1 function.

% All frequency values are in Hz.
Fs = 50000;  % Sampling Frequency

N    = 20;       % Order
Fc   = 10000;    % Cutoff Frequency
flag = 'scale';  % Sampling Flag

% Create the window vector for the design algorithm.
win = hann(N+1);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Fc/(Fs/2), 'low', win, flag);
Hd = dfilt.dffir(b);


% [EOF]
%signal in time domain
Ts = 1/Fs;
N = 64;
nts = 0 : Ts : (N-1)*Ts;
y = 5*sin(5000*2*pi*nts)+5*sin(20000*2*pi*nts)+10*sin(15000*2*pi*nts);

%signals in frequency domain
yf = fft(y);
yff = fftshift(yf);
F = linspace(-Fs/2,Fs/2,N);
bf = fft(b,N);
bff = fftshift(bf);
mul = bff.*yff;
con = conv(y,b);
subplot(3,2,1)
plot(nts,y)
subplot(3,2,3)
stem(b)
subplot(3,2,5) 
plot(con)
subplot(3,2,2)
plot(F,abs(yff))
subplot(3,2,4)
plot(F,abs(bff))
subplot(3,2,6)
plot(abs(mul))