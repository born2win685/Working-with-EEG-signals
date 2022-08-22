clc
b = co2a0000364;
a=smoothdata(b);
Fs=254;
fft_a = fftshift(abs(fft(a))/length(a));
fft_t = linspace(-Fs/2,Fs/2,length(a));

figure(1);
subplot(211);
plot(a,'r');
axis([0 16000 -40 60])
ylabel("Voltage(mV)");
xlabel("t(s)")
title("Data Set in time domain");
legend("signal");
grid on;

subplot(212);
plot(fft_t,(fft_a).');
ylabel("Voltage(mV)");
xlabel("Frequency(hz)")
title('Frequency Domain of the Alocholic Signal');
legend("signal");
grid on;
disp(Fs)

