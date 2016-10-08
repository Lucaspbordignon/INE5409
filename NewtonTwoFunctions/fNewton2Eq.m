function X = fNewton2Eq(Xi)
    % Resolvendo sistemas com 2 equações não lineares
    % Ex:
    %       F(x1, x2) = 2*x1 + ...
    %       F(x1, x2) = x1/4 + ...
    passo = 0;
    criterio = 1;
    tolerancia = 1e-15;

    while (criterio > tolerancia && passo < 100)
        passo = passo + 1
        % Função 1 : e^x1 + x2 - 1
        % Função 2 : x1² + x2² - 4
        A(1,1) = exp(Xi(1));    % Derivada parcial dF1/dx1
        A(1,2) = 1;             % Derivada parcial dF1/dx2
        A(1,3) = -(exp(Xi(1)) + Xi(2) - 1);
        A(2,1) = 2*Xi(1);       % Derivada parcial dF2/dx1
        A(2,2) = 2*Xi(2);       % Derivada parcial dF2/dx2
        A(2,3) = -(Xi(1)^2 + Xi(2)^2 - 4);

        delta_X = fgauss(2, A);
        criterio = sum(abs(delta_X))
        disp('')
        X = Xi .+ delta_X;
        Xi = X;
    end
end
