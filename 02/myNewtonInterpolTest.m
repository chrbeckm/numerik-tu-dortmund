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
% Input:
% Output: Plot der Interpolationspolynome mit unterschiedlich vielen Stützstellen
%         Maximaler Fehler jeder Stützstellenverteilung

f = @(x) (1+25*x.^2).^(-1); % Elementweise Definition der Rungefunktion
f1 = @(x) (1+25*x^2)^(-1); % Definition der Rungefunktion für Skalare
xrunge = -1:10^(-2):1; % Intervall der Interpolation
yrunge = f(xrunge); % Funktionswerte der Rungefunktion

for n = 7:5:17; % gegeben
      for i = 0:n;
            xt(i+1) = cos(((2*i+1)*pi)/(2*n+2)); % Bestimmung der Stützstellen
            ft(i+1) = f1(xt(i+1));               % und Werte
            xa(i+1) = -1 + 2 * i / n;            % t = Tschebyscheff
            fa(i+1) = f1(xa(i+1));               % a = Äquidistant
      end
      ca = myNewtonInterpol(xa, fa); % Übergabe der Faktoren
      pa = ca(n) * ones(size(xrunge)); % erstellen der Grundform des Interpolationspolynoms
      for k = n-1:-1:1
            pa = pa.*(xrunge-xa(k)) + ca(k); % Ausmultiplizieren mit den Newtonbasispolynomen und Faktoren
      end
      ct = myNewtonInterpol(xt, ft); % Übergabe der Faktoren
      pt = ct(n) * ones(size(xrunge)); % erstellen der Grundform
      for k = n-1:-1:1
            pt = pt.*(xrunge-xt(k)) + ct(k); % Ausmultiplizieren mit den Newtonbasispolynomen im Hornerschema
      end

      figure % Zeichnen der Daten nach Vorgabe
      plot(xrunge,yrunge,'g-;Runge-Funktion;',
      xa,fa,'r*;Aequidistante-Stuetzstellen;',
      xrunge,pa,'r-;Aequidistante Interpolation;',
      xt,ft,'b*;Tschebyscheff-Stuetzstellen;',
      xrunge,pt,'b-;Tschebyscheff Interpolation;')
      xlim([-1 1])
      ylim([-0.7 1])
      if n == 7 % Speichern, geht das schöner? num2str(n) wird so abgespeichert
            saveas(gcf,'PA2-1-N7','pdf');
            saveas(gcf,'PA2-1-N7','fig');
      end
      if n == 12
          saveas(gcf,'PA2-1-N12','pdf');
          saveas(gcf,'PA2-1-N12','fig');
      end
      if n == 17
          saveas(gcf,'PA2-1-N17','pdf');
          saveas(gcf,'PA2-1-N17','fig');
      end
      %delta = xrunge % selbe Schrittweite wurde für die Rungefunktion verwendet
      maxa = abs(yrunge(1)-pa(1)); % Variablen zur Speicherung der Maxiamlen Fehler
      maxt = abs(yrunge(1)-pt(1)); % der Fehler an der ersten Position wird als Startwert verwendet
      for i = 2:1:100;
            maxa1 = abs(yrunge(i)-pa(i)); % bilden des absoluten Fehlers an der entsprechenden Stelle
            if maxa1 > maxa; % Vergleichen mit vorherigem größten Fehler
                  maxa = maxa1; % Erneuern
            end
            maxt1 = abs(yrunge(i)-pt(i));
            if maxt1 > maxt;
                  maxt = maxt1;
            end
      end
      disp(['Anzahl von Stützstellen:', num2str(n)])
      disp(['Maximaler Fehler Äquidistant:', num2str(maxa)])
      disp(['Maximaler Fehler Tschebyscheff:', num2str(maxt)])
end

close all;
clear all;
