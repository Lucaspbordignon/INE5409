% Padé
% Melhor para funções racionais.
format long

a = 1;
b = 2;

% Numerador
n = 3;
% Denominador
m = 2;

% Grau de maclaurin(M) = m + n
coeficientes_mac = fMaclaurin(n+m);

% Coeficientes de Padé
% Porem, [a, b] estão em 't', já que fMaclaurin calcula para 't'.
[ap, bp] = fPade(n, m, coeficientes_mac)

% Plot
x_plot = a : 0.05 : b;
t_plot = (2 .* x_plot .- (b .+ a)) ./ (b .- a);
y_exato = log(x_plot);

y_pade = fPnBriot(n, ap, t_plot) ./ fPnBriot(m, bp, t_plot);
ErroPade = abs(y_pade .- y_exato)
ErroMaximoPade = max(ErroPade)
