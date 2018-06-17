%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 5
%% Aufgabennummer:   5.1
%% Programm Name:    LR-Zerlegung mit dem Thomas-Algorithmus
%%                      Weiterrechnen mit den Ausgabewerten
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

% Lösung der Teilaufgabe d):
% Ein u am Ende der Variable steht für unser Programm, m für den moodle-Ordner:
% Es ergeben sich die Werte:
nu = [10000, 100000, 1000000, 10000000]; % Dimension
laufzeitu = [0.42692, 4.2603, 42.3653, 423.3468]; % Laufzeit
% Es wird das Verhältnis von Laufzeit und Dimension bestimmt
verhlaufdimu = laufzeitu./nu
% Diese Werte liegen alle in der Größenordnung 4.2e-05, sodass ein linearer Zusammenhang besteht
% → α = 1

% Für die Dateien des Moodle-Ordners folgen:
nm = [10, 100, 1000];
laufzeitm = [0.00075102, 0.0060439, 2.3452];
verhlaufdimm = laufzeitm./(nm.^3)
% Die Abhängigkeit von O(n^3) ist für die beiden letzten Werte ersichtlich,
% bei der Laufzeit für n=10 wiegen die Rechenoperationen wie
% Matrixdefinition und Iteratrionschritte zu sehr auf
% je nach Implementierung kann die Matrixdefinition als nxn n^2 Operationen erfordern,
% was bei bei kleinen n mehr ins Gewicht fällt als bei großen
% Mit denselben Dimensionen folgt für unseren Algorithmus
laufzeitu1 = [0.00085998, 0.004287, 0.042207];
verhlaufdimu1 = laufzeitu1./nm
% hier ist wieder die Linearität sichtbar
save 51-1.txt
