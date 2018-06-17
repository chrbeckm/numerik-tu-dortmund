% Spezielle Lösung einer Aufgabe
% 04 - angepasst

format long
disp('Aufgabe')
anfangstuetz = 1;
anzahlstuetz = 15;
fa = @(x) e^x+1;
a = -1;
b = 1;

exakta = 2+e-1/e;

wt = [(b-a)/2, (b-a)/2];
pt = [0, 1];
mt = anfangstuetz:anzahlstuetz;
mtf = anfangstuetz:anzahlstuetz;

ws = [(b-a)/6, 4*(b-a)/6, (b-a)/6];
ps = [0, 0.5, 1];
ms = anfangstuetz:anzahlstuetz;
msf = anfangstuetz:anzahlstuetz;

for Nr = anfangstuetz:anzahlstuetz;
    mt(Nr) = myQuadraturSum1D(fa, wt, pt, a, b, Nr);
    mtf(Nr) = abs(exakta - mt(Nr));
    ms(Nr) = myQuadraturSum1D(fa, ws, ps, a, b, Nr);
    msf(Nr) = abs(exakta - ms(Nr));
end

mt
mtf
ms
msf

exakta
disp('Trapez')
myQuadraturSum1D(fa, wt, pt, a, b, 14)
disp('Fehler Trapez')
abs(exakta - myQuadraturSum1D(fa, wt, pt, a, b, 14))

disp('Simpson')
myQuadraturSum1D(fa, ws, ps, a, b, 2)
disp('Fehler Simpson')
abs(exakta - myQuadraturSum1D(fa, ws, ps, a, b, 2))

save 41.txt
