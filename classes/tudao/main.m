format long
% Aproximação ln(x) [1,2] com erro 1e-6
a = 1
b = 2

% 1º - Interpolação polinomial - Usando Lagrange
disp('---------------------------------------------')
disp('Lagrange')
grau = 7
h = (b - a)/grau % Dividindo igualitariamente os intervalos
X = a : h : b
Y = log(X)  % Funcao a ser aproximada
Xp = a : h/20 : b;
t_plot = (2 .* Xp .- (b .+ a)) ./ (b .- a);
Y_exato = log(Xp);
Y_lagrange = fLagrange(grau, X, Y, Xp);

% Erro
erro_Pn = abs(Y_lagrange .- Y_exato);
erro_maximo_lagrange = max(erro_Pn)
% Grafico do erro
%plot(Xp, erro_Pn, 'm')

% Grafico da funcao. Aproximado em vermelho, 'exato' em azul.
%plot(X, Y, 'square', Xp, Y_lagrange, 'r', Xp, Y_exato, 'b')


% 2º - Série de Maclaurin
% Transformação de variavel, para T entre [-1, 1]
% X(t) = (b - a)*t + (b + a)
%        ---------   -------
%            2          2
% F(X(t)) = ln(0.5t + 1.5)
disp('---------------------------------------------')
disp('Maclaurin')
N = 9
coeficientes_maclaurin = fMaclaurin(N);

% Para plotagem
h = (b-a)/N;

% X de plotagem
Xp = a : h/20 : b;

% Convertendo de volta, de T(x) para Xp
% X(t) = 0.5(b - a)*t + 0.5(b + a)
Tp = (2 .* Xp .- (b .+ a))/(b .- a);

% Interpolador
Y_maclaurin = fBriotRuffini(N, coeficientes_maclaurin, Tp);

% Função exata.
Y_exato_mac = log(Xp);

% Erro
erro_Pn = abs(Y_maclaurin .- Y_exato_mac);
erro_maximo_Maclaurin = max(erro_Pn)
% plot(Xp, erro_Pn, 'b')

% Plotando o gráfico
%plot(Xp, Y_exato, 'b', Xp, Y_polinomio, 'r')


% 3º - Série de Tchebychev
disp('---------------------------------------------')
disp('Tchebychev')

n = 7;
h = (b - a)/n;
Xp = a : h/20 : b;
t = (2 .* Xp .- (b .+ a) ./ (b .- a));
k = 3; % Grau da série

b = fTchebychev(k);

y_tcheby = b(1).*1+b(2).*t.+b(3).*(2.*t.^2.-1).+b(4).*(4.*t.^3.-3.*t).+b(5).*(8.*t.^4.-8.*t.^2.+1).+b(6).*(16.*t.^5-20.*t.^3.+5.*t).+b(7).*(32.*t.^6.-48.*t.^4.+18.*t.^2.-1);
y_exato = log(Xp);
erro_tcheby = abs(y_tcheby .- y_exato);
erro_tcheby_maximo = max(abs(erro_tcheby))








% 4º - Padé
disp('---------------------------------------------')
disp('Pade')
% Melhor para funções racionais.

% Numerador
n = 3;
% Denominador
m = 2;

% Grau de maclaurin(M) = m + n
coeficientes_mac = fMaclaurin(n+m);

% Coeficientes de Padé
% Porem, [a, b] estão em 't', já que fMaclauri:n calcula para 't'.
[ap, bp] = fPade(n, m, coeficientes_mac);

% Plot
%x_plot = a : 0.05 : b;
%t_plot = (2 .* x_plot .- (b .+ a)) ./ (b .- a);
%y_exato = log(x_plot);
y_pade = fPnBriot(n, ap, t_plot) ./ fPnBriot(n, bp, t_plot);
ErroPade = abs(y_pade .- Y_exato);
ErroMaximoPade = max(ErroPade)

