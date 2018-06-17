%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 5
%% Aufgabennummer:   5.1
%% Programm Name:    LR-Zerlegung mit dem Thomas-Algorithmus
%%                      lösen des Gleichungssystems durch Vorwärtssubstitution
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% e.g.
% Input: LR - nx3-MAtrix als LR-Zerlegung
%        b - rechte Seite des Gleichungssystems
%
% Output: y - Lösungsvektor des Gleichungssystem Ly=b
%

function [y] = forward_solve(LR, b)
    n = max(size(LR)); % Abspeichern der Größe der gegebenen Matrix
    c = 1; % zur Übersichtlichkeit
    y = 1:n; % Lösungsvektor
    y(1) = b(1); % erstes Element des Lösungsvektors
    for i = 2:n;
        y(i) = b(i)-LR(i, c)*y(i-1); % bestimmen der Einträge des Lösungsvektors
    end
