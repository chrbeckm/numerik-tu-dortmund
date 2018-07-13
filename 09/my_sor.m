%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 9
%% Aufgabennummer:   9.1
%% Programm Name:    Jacobi- und Gauß-Seidel-Verfahren
%%                      SOR-Verfahren
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
%    omega -
%
% Output: x - berechenter Lösungsvektor
%     numit - Anzahl der Iterationen
%

function [x, numit] = my_sor(A, b, x0, eps, maxit, omega)
    n = max(size(b)); % Speichern der Dimension
    relativerEingangsDefekt = norm(A*x0-b)/norm(x0); % Bestimmung des Abbruchkriteriums
    numit = 0; % Rückgabevariable, Anzahl der Iterationsschritte
    x = x0; % umspeichern des Startvektors
    m = 1; % Laufvariable der Iterationsschritte
    % Matrix für die Iteration bestimmen
    L = tril(A, -1);
    DplusL = diag(diag(A)) + omega*L;
    invDplusL = inv(DplusL); % invertieren
    % Formel aus der Vorlesung
    % x_k+1 = x_k + omega*DplusL*(b-A*x)
    while m <= maxit % Iterationsschleife
        x = x + omega*invDplusL*(b-A*x);
        if norm(A*x-b) < relativerEingangsDefekt % Abbruchbedingung
            if m == maxit
                disp('Wrnung: SOR-Verfahren nicht determiniert, Iteration abgebrochen!')
            end
            m = maxit+1;
        else
            m += 1; % hochzählen der Variablen
        end
        numit += 1;
    end
