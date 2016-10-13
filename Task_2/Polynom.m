% Usando dupla precisao
format long

% Equacao polinomial(complexa)
% P = (x- 0.9)(x-1)³ * (x-i)
P = [1, (-3.9 -1i), (5.7 + 3.9i), (-3.7 - 5.7i), (0.9 + 3.7i), (0 - 0.9i)];

% Questao 1
disp("Questao 1:")
Rlim = 1e-3
Roots = fRoots(P)

% Questao 2
disp("Questao 2:")
Roots_octave = roots(P)
Roots_wolfram = [0.9, 0.99999, 1i, 1.00001 + 8.96723e-6i, 1.00001 - 8.96723e-6i]

% Questao 3
disp("Questao 3: Exercicio 3.9")

% Questao 4
disp("Questao 4: Exercicio 4.3")
