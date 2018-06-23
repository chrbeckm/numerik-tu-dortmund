%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 7
%% Aufgabennummer:   7.1
%% Programm Name:    Newton-Verfahren
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% e.g.
% Input: f - Funktion deren Nullstelle bestimmt werden soll
%       df - Ableitung der Funktion f
%       x0 - Startwert der Iteration
%
% Output: x - Vektor der Stützstellen
%         e - Vektor der absoluten Stützstellendifferenzen
%         v - Vektor der  Funktionswerte an den Stützstellen
%

function [x, e, v] = myNewton(f, df, x0)
% Newtonverfahren
    N = 50; % maximale Anzahl an Iterationen
    x = zeros(N, 1); % Vektor der Stützstellen
    e = zeros(N, 1); % Vektor der Differenzen der Stützstellen
    v = zeros(N, 1); % Vektor der Funktionswerte an den Stützstellen
    x(1) = x0; % Setzen der Startwerte
    e(1) = 0;
    v(1) = f(x(1));
    i = 2;
    while i <= N;
        xh = x(i-1); % Abspeichern des vorherigen x-Wertes zur Übersichtlichkeit
        x(i) = xh-(v(i-1)/df(xh)); % Rekursive Berechnung der Stützstellen
        e(i) = abs(x(i)-xh); % Differenz der Stützstellen
        v(i) = f(x(i)); % Funktionsauswertung
        if v(i) == 0 % Abbruchbedingung
            i = N+1;
        end
        i = i+1;
    end
