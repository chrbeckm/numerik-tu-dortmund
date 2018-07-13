%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 9
%% Aufgabennummer:   9.1
%% Programm Name:    Jacobi- und Gauß-Seidel-Verfahren
%%                      LGS-Ersteller
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% e.g.
% Input: n - Dimension der Matrix
%
% Output: A - Matrix A des LGS
%         b - rechte Seite des LGS
%

function [A,b] = my_test_system(n)
    b = ones(n^2,1); % Vektor b
    nquad = n^2; % wird häufig gebraucht
    A = spdiags([-b -b 4*b -b -b],[-n -1 0 1 n], nquad, nquad); % Matrix definieren
    for i = 1:n-1 % gewünschte Nullen einsetzen
        A(i*n+1, i*n) = 0;
        A(i*n, i*n+1) = 0;
    end
