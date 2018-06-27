function [xneu, yneu] = newton2d(xalt, yalt, f1, f2, df1, df2, df3, df4)
    df = [df1(xalt, yalt) df2(xalt, yalt); df3(xalt, yalt) df4(xalt, yalt)]; % Jacobi-Matrix erstellen
    f = [-f1(xalt, yalt); -f2(xalt, yalt)]; % Funktionsvektor erstellen
    dx =df\f; % Gleichungssystem lösen
    xneu = dx(1) + xalt; % neue Werte bestimmen
    yneu = dx(2) + yalt;
