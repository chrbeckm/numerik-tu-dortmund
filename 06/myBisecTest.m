%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 6
%% Aufgabennummer:   6.1
%% Programm Name:    Bisektionsverfahren
%%                      Testdatei
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% e.g.
% Input:
%
% Output: Plots der Fehler gegen die Schrittanzahl
%

clear all;
close all;

f = @(x) (cos(2*x))^2-x^2; % Cosinus-Argument in Radiant
a = 0; % Anfangswert des Intervalls
b = 0.75; % Endwert des Intervalls
[x, e, v] = mybisect(f, a, b); % Funktionsaufruf

i = 1:length(v);
semilogy(i, e, 'b*;Bisektionsverfahren;'); % plotten
xlabel('# Iterationsschritte')
ylabel('|x_k - x_(_k_-_1_)|')

% speichern
saveas(gcf,'PA7-1','pdf')
saveas(gcf,'PA7-1','fig')

% Aufgabe c
% Die Konvergenz aus dem Plot sieht nach einer Exponentialen aus,
% da in halblogarithmischer Skalierung eine Gerade entsteht.
% Die Konvergenzgeschwindigkeit soll mit 2^(-n-1) gehen, einer Exponentialfunktion
% mit entsprechender Steigung.
