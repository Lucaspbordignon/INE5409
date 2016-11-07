function coeficientes = fMaclaurin(N)
    % Aplicando sobre a função F(x) = ln(x)
    % F(t=0) = ln(1.5)
    coeficientes(1) = log(1.5);
    % Derivada genérica, no ponto zero
    % F^k(0) = (-1)^(k-1) * (k-1)! * 3^(-k)
    for i = 2: N+1
        coeficientes(i) = (-1)^i * 1/((i-1) * 3^(i-1));
    end
end
