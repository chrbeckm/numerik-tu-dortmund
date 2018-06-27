close all;
clear all;
format long;

AnzahlDerIterationsschritte = 6;

% Funktionen
% f1
% f2
f1 = @(x, y) 1/6*cos(x)+1/3*y;
f2 = @(x, y) 1/8*sin(x)+1/8*x*y^2;

% Jacobimatrix
% df1 df2
% df3 df4
df1 = @(x, y) -1/6*sin(x);
df2 = @(x, y) 1/3;
df3 = @(x, y) 1/8*cos(x)+1/8*x*y;
df4 = @(x, y) 1/4*x*y;

% Startwerte
x0 = 0.5;
y0 = 0.5;

% Definieren von wichtigen Vektoren
N = AnzahlDerIterationsschritte + 1;
x = 1:N;
y = 1:N;
x(1) = x0;
y(1) = y0;

% Funktionsaufruf
for i = 2:N
    [x(i), y(i)] = newton2d(x(i-1), y(i-1), f1, f2, df1, df2, df3, df4);
end

% Ausgabe
x
y

% Fehlerabschätzung
disp('x-Wert')
fx = x(N)-x(N-1)
disp('y-Wert')
fy = y(N)-y(N-1)
disp('')

qz = 1/6*sin(1)+1/3
zeilenvektor = max(abs(fx), abs(fy))
zeilenfehler = zeilenvektor*qz/(1-qz)
disp('')

qs = 7/12
spaltenvektor = abs(fx) + abs(fy)
spaltenfehler = spaltenvektor*qs/(1-qs)

save 81.txt
