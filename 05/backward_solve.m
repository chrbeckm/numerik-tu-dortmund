%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 5
%% Aufgabennummer:   5.1
%% Programm Name:    LR-Zerlegung mit dem Thomas-Algorithmus
%%                      lösen des Gleichungssystems durch R[ckwärtssubstitution
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% e.g.
% Input: LR - nx3-MAtrix als LR-Zerlegung
%        y - Vektor aus der Vorwärtssubstitution
%
% Output: x - Lösungsvektor des Gleichungssystem Rx=y
%

function [x] = backward_solve(LR, y)
    n = max(size(LR)); % Abspeichern der Größe der gegebenen Matrix
    a = 2; % zur Übersichtlichkeit
    b = 3;
    x = 1:n; % Lösungsvektor
    x(n) = y(n)/(LR(n, a)); % letztes Element des Lösungsvektors
    for i = n-1:-1:1;
        x(i) = (y(i)-LR(i, b)*x(i+1))/(LR(i, a)); % bestimmen der Einträge des Lösungsvektors
    end
