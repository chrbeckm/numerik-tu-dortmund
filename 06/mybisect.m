%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 6
%% Aufgabennummer:   6.1
%% Programm Name:    Bisektionsverfahren
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% e.g.
% Input: f - Funktion
%        x00 - Anfangswert des Intervalls
%        x0 - Endwert des Intervalls
%
% Output: x - Vektor der iterierten xk
%         e - Abstände der xk
%         v - Funktionswerte f(xk)
%

function [x, e, v] = mybisect(f, x00, x0)
    n = log2((x0-x00)*10^(12))-1; % Anzahl der Schritte bei gegebenem Fehler
    n = n + 0.5; % Vorbereitung zum aufrunden
    n = round(n); % aufrunden
    x = zeros(1, n); % Vordefinieren der Rückgabe-Vektoren
    e = zeros(1, n);
    v = zeros(1, n);
    anfang = zeros(1, n); % Vektoren für die Teilintervalle
    ende =  zeros(1, n);

    % erster Schritt
    anfang(1) = x00; % Setzen der ersten Intervallgrenzen
    ende(1) = x0;
    x(1) = (anfang(1)+ende(1))/2; % Mittelpunkt des ersten Intervalls
    e(1) = abs(anfang(1)-ende(1)); % Fehler des Mittelwertes
    v(1) = f(x(1)); % Funktionswert am Intervallmittelpunkt

    % alle weiteren Schritte
    for i = 2:n;
        if v(i-1) ~= 0; % falls mit dem Mittelpunkt direkt getroffen wurde bricht es unten ab
            if f(anfang(i-1))*v(i-1)<0; % linkes Teilintervall
                anfang(i) = anfang(i-1); % Setzen der Teilintervallgrenzen
                ende(i) = x(i-1);
                x(i) = (anfang(i)+ende(i))/2; % Mittelpunkt
                e(i) = abs(anfang(i)-ende(i)); % Fehler des Intervalls
            elseif f(ende(i-1))*v(i-1)<0; % rechtes Teilintervall
                anfang(i) = x(i-1); % Setzen der Teilintervallgrenzen
                ende(i) = ende(i-1);
                x(i) = (anfang(i)+ende(i))/2; % Mittelpunkt
                e(i) = abs(anfang(i)-ende(i)); % Fehler des Intervalls
            end
            v(i) = f(x(i)); % Funktionswert
        else % Abbruchbedingung
            i = n+1;
        end
    end
