%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 2
%% Aufgabennummer:   2.1
%% Programm Name:    Interpolation
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% Input: a sind die Stützstellen
%        c sind die Werte an den Stützstellen
%
% Output: c sind die Faktoren, in der Vorlesung y [x_0,...]
%

function [c] = myNewtonInterpol(a,c) % Funktionsdeklarierung
    m = length(a);
    for k = 2:m
        c(k:m) = (c(k:m)-c(k-1:m-1))./(a(k:m)-a(1:m+1-k)); % bestimmen der Faktoren der Basispolynome
    end
% die Faktoren werden in einer Matrix gespeichert, sodass die wichtigen auf der Hauptdiagonalen liegen
