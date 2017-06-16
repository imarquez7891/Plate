t = linspace(-pi, 2*pi, 1000);
x = square(20*t);
plot(t, x/2); 
axis([ 0 1.5 -0.75 0.75 ]);
title('Square Wave Input')
xlabel ('Time')
ylabel('Amplitude')
%grid on
