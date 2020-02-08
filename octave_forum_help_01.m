% https://lists.gnu.org/archive/html/help-octave/2020-02/msg00013.html% Stef Pillaert% sprongfuncties in Matlab/Octave% Geheugen leegmakenclcclearclose all% basisgegevensEI=1000;% deze regel is enkel nodig in octave om symbolisch te kunnen werken, maar in% matlab niet.isOctave = exist('OCTAVE_VERSION', 'builtin') ~= 0;if isOctave    pkg load symbolicend% de variabele x declareren we als symbolisch, zodat er symbolisch mee kan% gerekend worden.syms M(x) C1 C2;%De M-functie:M(x)=13*x-heaviside(x-2)*15*(x-2)-heaviside(x-4)*9*(x-4)^2/2;%we maken de eerste van 2 subplotssubplot(2,1,1)if isOctave    fcn=(inline('13*x-heaviside(x-2)*15*(x-2)-heaviside(x-4)*9*(x-4)^2/2'))    ezplot(fcn(x), [0,6]);else    fplot(M(x),[0,6]);endintM(x)=int(M(x))+C1;intintM(x)=int(intM(x))+C2;% alfa(x)=-intM(x)/EI;z(x)=-intintM(x)/EI;rndvw=[z(0)==0,z(6)==0];onbek=[C1,C2];opl=solve(rndvw,onbek);C1=opl.C1C2=opl.C2%de tweede subplotsubplot(2,1,2)if isOctave    % do somethingelse    fplot(eval(z(x)),[0,6]);end    %de doorbuiging in het midden, eveneens in "variable precision arithmetic":eval(z(3)),vpa(eval(z(3)))%oppervlakte onder de vervormingslijn (evt. nuttig voor invloedslijnen)int(eval(z(x)),[0,6]),vpa(int(eval(z(x)),[0,6]))