format long

% Chute inicial
Xi = [1 -1]

X = fNewton2Eq(Xi)

% Metodo de newton com Derivada Numerica
X_derivada_numerica = fNewton2EqNumerico(Xi)

residuo_X = max(abs(F1(X)) , abs(F2(X)) )
residuo_X_derivada = max(abs(F1(X_derivada_numerica)) , abs(F2(X_derivada_numerica)) )
