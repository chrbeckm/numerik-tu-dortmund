%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 9
%% Aufgabennummer:   9.1
%% Programm Name:    Jacobi- und Gauß-Seidel-Verfahren
%%                      Jacobi
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% e.g.
% Input: A - Matrix des LGS
%        b - rechte Seite des LGS
%       x0 - Startvektor
%      eps - akzeptable Abweichung
%    maxit - Anzahl der maximalen Iterationen
%
% Output: x - berechenter Lösungsvektor
%     numit - Anzahl der Iterationen
%

function [x, numit] = my_jacobi(A, b, x0, eps, maxit)
    n = max(size(b)); % Speichern der Dimension
    relativerEingangsDefekt = norm(A*x0-b)/norm(x0); % Bestimmung des Abbruchkriteriums
    numit = 0; % Rückgabevariable, Anzahl der Iterationsschritte
    x = x0; % umspeichern des Startvektors
    m = 1; % Laufvariable der Iterationsschritte
    % Formel aus der Vorlesung
    % x_i^k+1 = 1/a_ii (b_i- Σa_ij x_j^k)
    [zeile spalte wert] = find(A); % Einträge der Matrix wegspeichern, aus Laufzeitgründen
    anzwerte = max(length(spalte)); % benötigt
    while m <= maxit % Iterationsschleife
        summe = zeros(n,1); % aufteilen der Formel
        for i = 1:anzwerte % durchlaufen der Matrix
            if spalte(i) ~= zeile(i) % dann darf der Wert benutzt werden
                summe(zeile(i)) += wert(i)*x(spalte(i)); % erhöhen der Summe
            end
        end
        for j = 1:n
            x(j) = 1/A(j, j)*(b(j)-summe(j)); % ausrechnen nach der Formel
        end
        if norm(A*x-b) < relativerEingangsDefekt % Abbruchbedingung
            if m == maxit
                disp('Warnung: Jacobi-Verfahren nicht determiniert, Iteration abgebrochen!')
            end
            m = maxit+1;
        else
            m += 1; % hochzählen der Variablen
        end
        numit += 1;
    end
