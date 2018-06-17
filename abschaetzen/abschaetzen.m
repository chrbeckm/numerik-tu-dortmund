% Ein kleines Programm zur Abschätzung von N!

close all;
clear all;

f1 = @(N) factorial(N)
f2 = @(N) N.^N-e.^(-N)

x = 10:100;
y1 = f1(x);
y2 = f2(x);

figure
subplot(1, 2, 1)
loglog(x, y1, 'b*;N!;')
subplot(1, 2, 2)
loglog(x, y2, 'r*;N^N-e^-N;')
saveas(gcf,'loglog','pdf')

fehler = abs(y1-y2)./y1
figure
loglog(x, fehler, 'b*;fehler;')
saveas(gcf,'plot','pdf')

figure
loglog(x, y1, 'b*;N!;', x, y2, 'r*;N^N-e^-^N;')
xlabel('N')
title('Beide Funltionen')
h = legend('b*;N!;', 'r*;N^N-e^-^N;')
legend(h, 'location', 'northwest')
saveas(gcf,'beide','pdf')
