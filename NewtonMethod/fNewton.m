% Algoritmo do Metodo de Newton.
format long

Xi = 2.5    % Chute inicial
dif = 1;
Passos = 0;

while (dif > 1e-15 && Passos < 100)
    Passos++;
    % Calculo de um novo x, melhorado em relação a xi
    % Usando a funcao F(x) = x * ln(x) - 3.2
    delta_X = -(Xi * log(Xi) - 3.2)/(log(Xi) + 1);    % delta_X = - F(x) / F'(x)
    X = Xi + delta_X;
    dif = abs(Xi - X);
    Xi = X;
end

disp("Resultado: ")
X
Passos
