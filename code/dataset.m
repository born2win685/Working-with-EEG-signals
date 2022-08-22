clc
b = co2a0000364;
a=smoothdata(b);
fs=254;

%delta 0.5 -4 Hz
b1 = fir1(51,[0.5/128 4/128]);
c1 = conv(a,b1,'same');

%alpha 8-14 Hz
b2=fir1(51,[8/128 14/128]);
c2=conv(a,b2,'same');

%beta  14-30 Hz
b3=fir1(51,[14/128 30/128]);
c3=conv(a,b3,'same');

figure(1)
subplot(311)
plot(c1,'b')
axis([0 1000 -20 20])
ylabel("Voltage(mV)");
xlabel("t(s)")
title("Delta");
legend("signal");
grid on;

subplot(312)
plot(c2,'r')
axis([0 1000 -20 20])
ylabel("Voltage(mV)");
xlabel("t(s)")
title("Alpha");
legend("signal");
grid on;

subplot(313)
plot(c3,'y')
axis([0 1000 -20 20])
ylabel("Voltage(mV)");
xlabel("t(s)")
title("Beta");
legend("signal");
grid on;


figure(2)
plot(c1,'b'); hold on;
plot(c2,'r');hold on;plot(c3,'y');
axis([0 1000 -20 20])
ylabel("Voltage(mV)");
xlabel("t(s)")
title("Comparing alpha beta and delta");
legend(["Delta","Alpha","Beta"]);
grid on;