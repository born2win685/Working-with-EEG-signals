clc;
b = co2a0000364; % Data Set
a=smoothdata(b);
Fs=254; % Sampling Frequency.

fft_a = fftshift(abs(fft(a))/length(a));
fft_t = linspace(-Fs/2,Fs/2,length(a));



n=8225;
N=length(fft_a);
vec_d=zeros(N,1);
p=round(N/254);
pos=(n:n+4*p);
vec_d(pos)=1;
pos_=(n-4*p:n);
vec_d(pos_)=1;

n=8225;
N=length(fft_a);
vec_a=zeros(N,1);
pos=(n+8*p:n+14*p);
vec_a(pos)=1;
pos_=(n-14*p:n-8*p);
vec_a(pos_)=1;

n=8225;
N=length(fft_a);
vec_b=zeros(N,1);
pos=(n+14*p:n+30*p);
vec_b(pos)=1;
pos_=(n-30*p:n-14*p);
vec_b(pos_)=1;

vec_1=vec_d.*fft_a;
vec_2=vec_a.*fft_a;
vec_3=vec_b.*fft_a;

figure(1)

subplot(311)
plot(fft_t,(vec_1))
axis([-50 50 0 2.7]);
ylabel("Voltage(mV)");
xlabel("freq(Hz)")
title("Delta");
legend("signal");
grid on;

subplot(312)
plot(fft_t,(vec_2))
axis([-50 50 0 2.7]);
ylabel("Voltage(mV)");
xlabel("freq(Hz)")
title("Alpha");
legend("signal");
grid on;

subplot(313)
plot(fft_t,(vec_3))
axis([-50 50 0 2.7]);
ylabel("Voltage(mV)");
xlabel("freq(Hz)")
title("Beta");
legend("signal");
grid on;



vec_dd=ifft(vec_d);
cc1=conv(a,vec_dd,'same');
vec_aa=ifft(vec_a);
cc2=conv(a,vec_aa,'same');
vec_bb=ifft(vec_b);
cc3=conv(a,vec_bb,'same');

figure(2)
subplot(311)
plot(cc1,'b')
axis([1000 2000 -1.5 2])
ylabel("Voltage(mV)");
xlabel("t(s)")
title("Delta");
legend("signal");
grid on;



subplot(312)
plot(cc2,'r')
axis([1000 2000 -1.5 2])
ylabel("Voltage(mV)");
xlabel("t(s)")
title("Alpha");
legend("signal");
grid on;

subplot(313)
plot(cc3,'y')
axis([1000 2000 -1.5 2])
ylabel("Voltage(mV)");
xlabel("t(s)")
title("Beta");
legend("signal");
grid on;


