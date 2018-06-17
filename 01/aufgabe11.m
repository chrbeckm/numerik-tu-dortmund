%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 1
%% Aufgabennummer:   1.1
%% Program name:     Auslöschung - e-Funktionen
%%
%% Program(version): Octave-4.2.2
%% OS:               Ubuntu 16.04 64bit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
%
% Input:
%
% Ablauf: x ist der Exponent
%         a ist die Variable für den Summenwert
%         n sind die vorgegebenen Obergrenzen der Summe
%         k ist die Laufvariable der Summe
%
% Output: Datei der Variablen zur Nutzung eines Makefiles
%

format long
x = -5.5 ;
a = 0;
% Berechnung mit Naeherung:

disp('Naeherung: ')
for n = 3:3:30; % Obergrenzenschleife
  for k = 0:n; % Summenschleife
    a  = a + (x^k)/(factorial(k));
  end
  disp(['Fuer z = ' num2str(n) ' ist a = ' num2str(a)] );
  a = 0;
end
disp(['Mit e = ' num2str(e^(-5.5))] );
% erste Umformung: e^-5.5 = 1/e^5.5
disp(['Erste Umformung mit e = ' num2str(1/(e^(5.5)))] );
% zweite Umformung: e^-5.5 = (e^-5.5)^11
disp(['Zweite Umformung mit e = ' num2str((e^(-0.5))^(11))] );
printf('Gegebener Wert: e^(-5.5)=0.0040867714\n')
save 11.txt

close all;
clear all;
