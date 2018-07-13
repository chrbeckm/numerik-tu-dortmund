%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 9
%% Aufgabennummer:   9.1
%% Programm Name:    Jacobi- und Gauß-Seidel-Verfahren
%%                      Test-Datei
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% e.g.
% Input:
%
% Output:
%

close all;
clear all;
format long

anfang = 10; % variabler Anfangswert für die minimale Dimension
ende = 60; %  variabler Anfangswert für die maximale Dimension
jacobi = anfang:ende; % Vektoren für die Anzahl der Iterationschritte
vektor = anfang:ende;
gauseidel = anfang:ende;
sor = anfang:ende;
iterationen = anfang:ende;

fehler = 1e-6; % vorgegebener Fehler
maxit = 1e8; % vorgegebene maximale Anzahl an Iterationen

for n = anfang:ende-1
    [A b] = my_test_system(n); % Bestimmen des jeweiligen Systems
    [xend jacobi(n-9)] = my_jacobi(A, b, b, fehler, maxit);
    [xend vektor(n-9)] = my_jacobi_vector(A, b, b, fehler, maxit);
    [xend gauseidel(n-9)] = my_gauss_seidel(A, b, b, fehler, maxit);
    wopt = 2/(1+sin(pi/n));
    [xend sor(n-9)] = my_sor(A, b, b, fehler, maxit, wopt);
end

n = ende % letzter Wert der vorgegebenen Grenze
[A b] = my_test_system(n); % System bestimmen
tic; % Zeiten nehmen und Fumktionsaufrufe
[xend jacobi(n-9)] = my_jacobi(A, b, b, fehler, maxit);
t = toc;
disp(['Jacobi, Zeit: ', num2str(t)])
tic;
[xend vektor(n-9)] = my_jacobi_vector(A, b, b, fehler, maxit);
t = toc;
disp(['Jacobi-Vektor, Zeit: ', num2str(t)])
tic;
[xend gauseidel(n-9)] = my_gauss_seidel(A, b, b, fehler, maxit);
t = toc;
disp(['Gauss-Seidel, Zeit: ', num2str(t)])
wopt = 2/(1+sin(pi/n));
tic;
[xend sor(n-9)] = my_sor(A, b, b, fehler, maxit, wopt);
t = toc;
disp(['SOR-Verfahren, Zeit: ', num2str(t)])

% Ausgabe in der Konsole, Zeiten in Sekunden:
% n = 60
% Jacobi, Zeit: 1021.2358
% Jacobi-Vektor, Zeit: 18.7324
% Gauss-Seidel, Zeit: 20.6159
% SOR-Verfahren, Zeit: 7.609

plot(iterationen, jacobi, 'r*;Jacobi;',
    iterationen, vektor, 'b.;Jacobi-Vektor;',
    iterationen, gauseidel, 'g*;Gauss-Seidel;',
    iterationen, sor, 'k*;SOR;')
h = legend('Jacobi', 'Jacobi-Vektor', 'Gauss-Seidel', 'SOR');
legend(h, 'location', 'northwest')
grid()
xlabel('Dimension')
ylabel('# Iterationen')
saveas(gcf, 'PA10','pdf')

save PA10.txt
