%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 5
%% Aufgabennummer:   5.1
%% Programm Name:    LR-Zerlegung mit dem Thomas-Algorithmus
%%                      Testdatei
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% e.g.
% Input:
%
% Output: Lösungsvektor zum jeweiligen Gleichungssystem
%         Laufzeit der Funktionen
%         51.txt as always für das Makefile
%

close all;
clear all;

% function LR_Test()
dimension = [10000, 100000, 1000000, 10000000]; % Vektor der vorgegebenen Dimensionen
anzahldim = length(dimension); % Länge des Dimensionvektors
residuen = 1:anzahldim; % Vektor für die Residuen
t = 1:anzahldim; % Vektor für die Berechnungszeiten
for n = 1:anzahldim;
    A = gallery('tridiag', dimension(n), -2, 8, -2); % Definition der jeweiligen Matrix
    b = 1:dimension(n); % Vordefinition des Vektors b
    for i = 2:(dimension(n)/2)-1; % Einspeichern der richtigen Belegung
        b(i) = 1;
    end
    for i = (dimension(n)/2):dimension(n);
        b(i) = 2;
    end
    disp(['n = ', num2str(dimension(n))])
    tic; % Zeitnahme der LR-Zerlegung
    lr = thomas_decompose(A); % LR_Zerlegung
    t(n) = toc;
    y = forward_solve(lr, b); % Vorwärts einsetzen
    x = backward_solve(lr, y); % Rückwärts einsetzen
    % Residuum
    residuen(n) = norm(x*A-b); % nach Aufgabenstellung
    disp(['Residuum = ', num2str(residuen(n))]) % Ausgabe
    disp(['Laufzeit = ', num2str(t(n))])
end

save 51.txt
