t = 0: .0001 : 1.5 ;
x = sawtooth (2 * pi * 5 * t, 0.5);
plot(t, (x+1)/2); 
axis([ 0 1.5 0 1.5 ]);
title('Triangle Wave Output')
xlabel ('Time')
ylabel('Amplitude')