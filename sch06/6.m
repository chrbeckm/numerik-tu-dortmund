% Lösung einer schriftlichen Aufgabe aufgrund von Faulheit

format long
n = 7;

disp('a')
pa = [1 0 -4 0 4]
x = 1:n;
x(1) = 1.1;
yf = 1:n;
yf1 = 1:n;
for i = 1:n-1;
    yf(i) = polyval(pa, x(i));
    yf1(i) = polyval(polyder(pa), x(i));
    x(i+1) = x(i)-yf(i)/yf1(i);
end
yf(n) = polyval(pa, x(n));
yf1(n) = polyval(polyder(pa), x(n));

yf
yf1
x
abs(x(n)-sqrt(2))

disp('c')
pa = [1 0 -5 0 6]
x = 1:n;
x(1) = 1.1;
yf = 1:n;
yf1 = 1:n;
for i = 1:n-1;
    yf(i) = polyval(pa, x(i));
    yf1(i) = polyval(polyder(pa), x(i));
    x(i+1) = x(i)-yf(i)/yf1(i);
end
yf(n) = polyval(pa, x(n));
yf1(n) = polyval(polyder(pa), x(n));

yf
yf1
x

abs(x(n)-sqrt(2))

save 6.txt
