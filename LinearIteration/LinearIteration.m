% Metodo da iteracao linear para calculo da raiz de uma funcao.
format long

% Chute inicial
Xi = 2.5
criterio_parada = 1e-16;
dif = 1;
Passos = 0;
lambda = 0.52;    % Fator de relaxacao(sub-relaxacao).
lambda_aux = 1 - lambda;

while (dif > criterio_parada && Passos < 1000)
    Passos++;
    % Utilizando a funcao F(x) = x * ln(x) -3.2
    X = (lambda_aux * Xi) + (lambda * 3.2/log(Xi));
    dif = abs(X - Xi);
    Xi = X;
end

disp("Resultado: ")
X
Passos
