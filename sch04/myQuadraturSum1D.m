% Description of the program
% e.g.
% Input: f - Funktion
%        w - Quadraturgewichte
%        p - Stützstellen auf Einheitsintervall
%        a - untere Grenze
%        b - obere Grenze
%        N - Anzahl der Teilintervalle
% Output: v - Wert der Formel
%

function [v] = myQuadraturSum1D(f, w, p, a, b, N)
    v = 0;
    if a < b; % Abfangen von falschen Grenzens
        R = length(w); % Dimension des Gewichtsvektors
        h = (b-a)/N; % Schrittweite definieren
        for l = 1:N; % Summe der Berechnung
            c = 0;
            for i = 1:R; % Integrationsschleife
                c = c + w(i) * f(a + (l-1)*h + p(i)*h); % Errechnen des Wertes,
            end % mit Gewicht*Funktion(Teilintervallanfang+Einheitsschritt*Schrittweite)
            v = v + c; % addieren der Teilintegrale
        end
    end
    v = v/N; % normieren des Ergebnisses
