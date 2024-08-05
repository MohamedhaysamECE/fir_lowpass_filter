clc;
clear all;
close;
Fs = 50000;
Ts = 1/Fs;
N = 64;
nts = 0 : Ts : (N-1)*Ts;
y = 5*sin(5000*2*pi*nts)+5*sin(20000*2*pi*nts)+10*sin(15000*2*pi*nts);
%normalizing the signal
y_norm = y/max(abs(y));
%scaling the signal 
y_scaled = int16(y_norm*32767);
%convert to binary 
y_binary = dec2bin(typecast(y_scaled,'uint16'),16);
%save binary values in textfile
fid = fopen('binary_signal.txt','w');
for i = 1:size(y_binary,1)
    fprintf(fid, '%s\n', y_binary(i,:));
end
fclose(fid);