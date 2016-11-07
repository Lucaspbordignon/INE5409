% Aproximação de F(x) = ln(x) entre [1, 2] usando série de Maclaurin
% Erro de, no máximo, 1e-6

% Transformação de variavel, para T entre [-1, 1]
% X(t) = (b - a)*t + (b + a)
%        ---------   -------
%            2          2
% F(X(t)) = ln(0.5t + 1.5)
N = 9
coeficientes_maclaurin = fMaclaurin(N)

% Para plotagem
a = 1;
b = 2;
h = (b-a)/N;

% X de plotagem
Xp = a : h/20 : b;

% Convertendo de volta, de T(x) para Xp
% X(t) = 0.5(b - a)*t + 0.5(b + a)
Tp = (2*Xp .- (b .+ a))/(b .- a);

% Interpolador
Y_polinomio = fBriotRuffini(N, coeficientes_maclaurin, Tp);

% Função exata.
Y_exato = log(Xp);

% Erro
erro_Pn = abs(Y_polinomio .- Y_exato);
erro_maximo = max(erro_Pn)
% plot(Xp, erro_Pn, 'b')

% Plotando o gráfico
plot(Xp, Y_exato, 'b', Xp, Y_polinomio, 'r')

