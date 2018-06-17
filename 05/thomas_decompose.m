%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 5
%% Aufgabennummer:   5.1
%% Programm Name:    LR-Zerlegung mit dem Thomas-Algorithmus
%%                      LR-Zerlegung für den Thomas-Algorithmus
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% e.g.
% Input: A - Tridiagonal Matrix
%
% Output: LR - LR-Zerlegung der Matrix A
%

function [LR] = thomas_decompose(A)
    n = max(size(A)); % Abspeichern der Größe der gegebenen Matrix
    LR = zeros(n, 3); % Matrix für die LR-Zerlegung, in Reihenfolge γ, α, β, nach Skript
    a = 2; % Definieren der Spaltennumern zur Übersichtlichkeit, Hauptdiagonale R
    b = 3; % Nebendiagonale R
    c = 1; % Nebendiagonale L
    i = 1; % Startwerte der LR-Zerlegung
    LR(i, a) = A(1, 1); % erste Einträge setzen
    LR(i, b) = A(1, 2);
    for i = 2:n-1; % Iteration für die LR-Zerlegung
        LR(i, c) = A(i-1, i)/(LR(i-1, a)); % Berechnung der γ
        LR(i, a) = A(i, i)-LR(i, c)*LR(i-1, b); % Berechnung der α
        LR(i, b) = A(i+1, i); % Berechnung der β
    end
    % letzter Schritt der LR-Zerlegung
    LR(n, c) = A(n-1, n)/(LR(n-1, a)); % Berechnung der γ
    LR(n, a) = A(n, n)-LR(n, c)*LR(n-1, b); % Berechnung der α
