% Usando dupla precisao
format long

% Equacao polinomial(complexa)
% P = (x- 0.9)(x-1)³ * (x-i)
P = [1, (-3.9 -1i), (5.7 + 3.9i), (-3.7 - 5.7i), (0.9 + 3.7i), (0 - 0.9i)]

% Questao 1
Roots = fRoots(P)
