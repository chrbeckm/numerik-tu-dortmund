%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 9
%% Aufgabennummer:   9.1
%% Programm Name:    Jacobi- und Gauß-Seidel-Verfahren
%%                      Gauß-Seidel
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

function [x, numit] = my_gauss_seidel(A, b, x0, eps, maxit)
    n = max(size(b)); % Speichern der Dimension
    relativerEingangsDefekt = norm(A*x0-b)/norm(x0); % Bestimmung des Abbruchkriteriums
    numit = 0; % Rückgabevariable, Anzahl der Iterationsschritte
    x = x0; % umspeichern des Startvektors
    m = 1; % Laufvariable der Iterationsschritte
    DplusL = tril(A);
    invDplusL = inv(DplusL); % invertieren
    % Formel aus der Vorlesung
    % x_k+1 = x_k + invDplusL*(b-A*x)
    while m <= maxit % Iterationsschleife
        x = x + invDplusL*(b-A*x);
        if norm(A*x-b) < relativerEingangsDefekt % Abbruchbedingung
            if m == maxit
                disp('Warnung: Gauß-Seidel-Verfahren nicht determiniert, Iteration abgebrochen!')
            end
            m = maxit+1;
        else
            m += 1; % hochzählen der Variablen
        end
        numit += 1;
    end
