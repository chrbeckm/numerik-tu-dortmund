%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 8
%% Aufgabennummer:   8.1
%% Programm Name:    Fixpunktiteration
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% e.g.
% Input:
%
% Output: Konsole: Stützstellen
%                   Differenz der Stützstellen
%           Datei der Variablen
%

close all;
clear all;
format long

h = [1/6 1/3 -1 1/6]; % Definition der Funktion als Polynom
dh = polyder(h); % Ableitung der Funktion
x0 = 0; % Setzen des Startwertes
n = 2; % 2 Iterationschritte

[x, e, v] = myNewton2pol(h, dh, x0, n); % Funktionsaufruf
disp('Stützstellen')
x
disp('Differenz der Stützstellen')
e

save 81.txt
