%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 4
%% Aufgabennummer:   4.1
%% Programm Name:    Zusammengestzte Quadratur
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% e.g.
% Input:
% Output: myQuadraturSum1DPlot.pdf - Plot zum selber anschauen, bisher noch nichts für *.fig gefunden
%         myQuadraturSum1DPlot.fig - Plot nach Aufgabenstellung

clear all;
close all;

format long

disp('Runge Funktion')
exaktr = 0.4*atan(5); % exakter Wert des Integrals

anzahlstuetz = 1000; % Anzahl von Stützstellen, variabel wegen Testläufen
N = 1:anzahlstuetz; % Vektor zum plotten später

fr = @(x) 1/(1+25*x^2); % Definition der Runge-Funktion
ar = -1; % Untere Grenze für die Runge-Funktion
br = 1; % Obere Grenze für die Runge-Funktion

wtr = [(br-ar)/2, (br-ar)/2]; % Gewichte der Trapezregel, Runge
pt = [0, 1]; % Stützstellen der Trapezregel
mtr = 1:anzahlstuetz; % Vektor für Ergebnisse, Trapezregel, Runge

wsr = [(br-ar)/6, 4*(br-ar)/6, (br-ar)/6]; % Gewichte der Simpsonregel
ps = [0, 0.5, 1];   % Stützstellen der Simpsonregel
msr = 1:anzahlstuetz; % Vektor für Ergebnisse, Simpsonregel, Runge


disp('Aufgabe')
fa = @(x) e^x+1; % Definition der Funktion aus Aufgabe 3.1
aa = 0; % untere Grenze für die Aufgabenfunktion
ba = 1; % obere Grenze für die Aufgabenfunktion
exakta = e; % exakter Wert des Integrals
wta = [(ba-aa)/2, (ba-aa)/2]; % Gewichte, Trapez, Aufgabe
pta = [aa, ba]; % Stützstellen, Trapez, Aufgabe
mta = 1:anzahlstuetz; % Vektor für Ergebnisse

wsa = [(ba-aa)/6, 4*(ba-aa)/6, (ba-aa)/6]; % Gewichte, Simpson, Aufgabe
psa = [0, 0.5, 1]; % Stützstellen , Simpson, Aufgabe
msa = 1:anzahlstuetz; % Vektor für Ergebnisse

for Nr = 1:anzahlstuetz; % Funktionsaufruf und Fehlerbestimmung in einem
    mtr(Nr) = abs(exaktr - myQuadraturSum1D(fr, wtr, pt, ar, br, Nr));
    msr(Nr) = abs(exaktr - myQuadraturSum1D(fr, wsr, ps, ar, br, Nr));
    mta(Nr) = abs(exakta - myQuadraturSum1D(fa, wta, pta, aa, ba, Nr));
    msa(Nr) = abs(exakta - myQuadraturSum1D(fa, wsa, psa, aa, ba, Nr));
end

subplot(1,2,1); % Zeichen, getrennt nach Funktion
loglog( N, mtr,'r*;R;',
        N, mta,'b*;A;');
title('Trapez-Regel-Fehler') % Zeichnen im doppeltlogarithmierten
h = legend('Runge-Funktion', 'Funktion aus Aufgabe 3.1');
legend(h, 'location', 'southwest');
xlabel('# Teilintervalle');
ylabel('Fehler');

subplot(1,2,2);
loglog( N, msa, 'b*;R;',
        N, msr, 'r*;A;');
title('Simpson-Regel-Fehler');
h = legend('Runge-Funktion', 'Funktion aus Aufgabe 3.1');
legend(h, 'location', 'southwest');
xlabel('# Teilintervalle');
ylabel('Fehler');

saveas(gcf,'myQuadraturSum1DPlot','pdf')
saveas(gcf,'myQuadraturSum1DPlot','fig')
