%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 1
%% Aufgabennummer:   1.2
%% Program name:     Auslöschung - Polynom
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
%
% Input:
%
% Output: Speichern des Plots

% Definieren der zu plottenden Funktion:
% Definieren des Intervalls:
x = 0.8:5*10^(-5):1.2;
% Funktion 1:
y = single((x-1).^7);
% Funktion 2:
yh = single(((((((x - 7).*x + 21).*x -35).*x + 35).*x - 21).*x + 7).* x -1);

% Plotting:
subplot(1, 2, 1);
plot(x, y) % Polynom-Form
title('Die zu untersuchende Funktion (x-1)^(7)')
grid
xlabel('x-Wert')
ylabel('f(x)')
subplot(1, 2, 2);
plot(x, yh) %Horner-Form
title('Die zu untersuchende Horner-Form')
grid
xlabel('x-Wert')
ylabel('f(x)')
saveas(gcf,'12','png')
% print -dpng 12.png

close all;
clear all;
