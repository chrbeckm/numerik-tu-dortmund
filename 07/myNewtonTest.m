%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2018     %%%
%%   Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Uebungszettel-Nr: Blatt 7
%% Aufgabennummer:   7.1
%% Programm Name:    Newton-Verfahren
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% e.g.
% Input: epa6 - Stützstellendifferenzen des Bisektionsverfahres aus 06
%
% Output: Plot der Stützstellendifferenzen für Newton- und Bisektionsverfahren
%           gegen die Anzahl der Iterationschritte
%

close all;
clear all;

% Einspeichern der Werte aus 06
epa6 = [7.500000000000000000e-01 3.750000000000000000e-01 1.875000000000000000e-01 9.375000000000000000e-02 4.687500000000000000e-02 2.343750000000000000e-02 1.171875000000000000e-02 5.859375000000000000e-03 2.929687500000000000e-03 1.464843750000000000e-03 7.324218750000000000e-04 3.662109379999999980e-04 1.831054689999999990e-04 9.155273439999999448e-05 4.577636719999999724e-05 2.288818359999999862e-05 1.144409179999999931e-05 5.722045899999999655e-06 2.861022949999999827e-06 1.430511470000000001e-06 7.152557370000000080e-07 3.576278690000000058e-07 1.788139340000000011e-07 8.940696720000000392e-08 4.470348360000000196e-08 2.235174180000000098e-08 1.117587090000000049e-08 5.587935450000000245e-09 2.793967720000000204e-09 1.396983860000000102e-09 6.984919309999999933e-10 3.492459650000000254e-10 1.746229830000000098e-10 8.731149139999999514e-11 4.365574569999999757e-11 2.182787280000000037e-11 1.091393640000000019e-11 5.456968209999999776e-12 2.728484110000000133e-12];
ipa6 = 1:length(epa6);

f = @(x) (cos(2*x))^2-x^2 % Definieren der Funktion und ihrer Ableitung
df = @(x) -2*x-4*sin(2*x)*cos(2*x);
x0 = 0.75; % Setzen des Startwertes

[x, e, v] = myNewton(f, df, x0); % Funktionsaufruf

% Diesr Block dient zum Abfangen von nicht positiven Werten im halblogarithmischen Plot
i = length(v);
m = 1;
for k = 2:i
    if e(k) ~= 0
        m = m+1;
    end
end
en = 1:m;
for i = 1:m
    en(i) = e(i);
end
e = en(2:end);
i = 2:m;

% Plotten
semilogy(i, e, 'r*;Newton;',
        ipa6, epa6, 'b*;Bisektion;')
xlabel('# Iterationsschritte')
ylabel('|x_k - x_(_k_-_1_)|')
saveas(gcf,'PA8-1','fig')
saveas(gcf,'PA8-1','pdf')

% Aufgabe c)
% Die theoretische Konvergenz des Newton-Verfahrens ist quadratisch.
% Im Plot wird deutlich, dass dies auch in der Praxis so ist.
% Das Bisektionsverfahren konvergiert weiterhin sichtbar linear.
