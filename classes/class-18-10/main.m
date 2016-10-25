format long

% Aproximação de Log(x) entre [a, b]
a = 1
b = 2
grau = 2    % Numero de intervalos
h = (b - a)/grau % Dividindo igualitariamente os intervalos
X = a : h : b
Y = log(X)  % Funcao a ser aproximada

coeficientes = fPolyInterpolacao(X, Y, grau)

% X usado para calculo do erro
Xp = a : h/20 : b;
% Interpolador
Y_polinomio = fBriotRuffini(grau, coeficientes, Xp);
% Função exata.
Y_exato = log(Xp);

% Erro
erro_Pn = abs(Y_polinomio .- Y_exato);
erro_maximo = max(erro_Pn)
% Grafico do erro
%plot(Xp, erro_Pn, 'm')

% Grafico da funcao. Aproximado em vermelho, 'exato' em azul.
plot(X, Y, 'square', 'markersize', 10, 2.2, 0, Xp, Y_polinomio, 'r', Xp, Y_exato, 'b')
