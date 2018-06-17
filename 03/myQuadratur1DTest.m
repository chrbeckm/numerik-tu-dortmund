%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 3
%% Aufgabennummer:   3.1
%% Programm Name:    Quadratur
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% Input:
% Output: Datei mit den Variablen für das Makefile

format long
funktion = @(x) (e^x+1); % Funktionsdefinition

disp('geschlossen')
vorfaktor = 1/6; % Vorfaktor des jeweiligen Quadraturpolynoms
gewichtung = [1, 4, 1]; % Gewichtung der einzelnen Stützstellen
stuetzstellen = [0, 1/2, 1]; % Stuetzstellen
gewichtung = gewichtung*vorfaktor; % tatsächliche Faktoren im Polynom
c = myQuadratur1D(funktion, gewichtung, stuetzstellen); % Funktionsaufruf
disp(['n = 2, Simpson: ', num2str(c)]) % Ausgabe des Wertes
disp(['Fehler: ', num2str(abs(e-c))]) % Ausgabe des Fehlers
disp(['relativer Fehler: ', num2str(abs(e-c)/e)]) % Ausgabe des relativen Fehlers
%bei weiteren Blöcken analog
vorfaktor = 1/8;
gewichtung = [1, 3, 3, 1];
stuetzstellen = [0, 1/3, 2/3, 1];
gewichtung = gewichtung*vorfaktor;
c = myQuadratur1D(funktion, gewichtung, stuetzstellen);
disp(['n = 3: ', num2str(c)])
disp(['Fehler: ', num2str(abs(e-c))])
disp(['relativer Fehler: ', num2str(abs(e-c)/e)])

disp('geschlossen')
vorfaktor = 1/2;
gewichtung = [1, 1];
stuetzstellen = [1/3, 2/3];
gewichtung = gewichtung*vorfaktor;
c = myQuadratur1D(funktion, gewichtung, stuetzstellen);
disp(['n = 1: ', num2str(c)])
disp(['Fehler: ', num2str(abs(e-c))])
disp(['relativer Fehler: ', num2str(abs(e-c)/e)])

vorfaktor = 1/24;
gewichtung = [11, 1, 1, 11];
stuetzstellen = [1/5, 2/5, 3/5, 4/5];
gewichtung = gewichtung*vorfaktor;
c = myQuadratur1D(funktion, gewichtung, stuetzstellen);
disp(['n = 3: ', num2str(c)])
disp(['Fehler: ', num2str(abs(e-c))])
disp(['relativer Fehler: ', num2str(abs(e-c)/e)])

save 31.txt

close all;
clear all;
