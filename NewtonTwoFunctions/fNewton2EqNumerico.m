function X = fNewton2EqNumerico(Xi)
    % Resolvendo sistemas com 2 equações não lineares
    % usando derivadas numericas(lim ...)
    % Ex:
    %       F(x1, x2) = 2*x1 + ...
    %       F(x1, x2) = x1/4 + ...
    passo = 0;
    criterio = 1;
    tolerancia = 1e-14;
    delta_X = [1e-4 1e-4];

    while (criterio > tolerancia && passo < 100)
        passo = passo + 1
        % Função 1 : e^x1 + x2 - 1
        % Função 2 : x1² + x2² - 4
        A(1,1) = ( F1([Xi(1) + delta_X(1), Xi(2)]) - F1(Xi) )/delta_X(1);     % Derivada parcial dF1/dx1
        A(1,2) = ( F1([Xi(1), Xi(2) + delta_X(2)]) - F1(Xi) )/delta_X(2);     % Derivada parcial dF1/dx2
        A(1,3) = -F1(Xi);
        A(2,1) = ( F2([Xi(1) + delta_X(1), Xi(2)]) - F2(Xi) )/delta_X(1);     % Derivada parcial dF2/dx1
        A(2,2) = ( F2([Xi(1), Xi(2) + delta_X(2)]) - F2(Xi) )/delta_X(2);     % Derivada parcial dF2/dx2
        A(2,3) = -F2(Xi);

        delta_X = fgauss(2, A);
        criterio = sum(abs(delta_X))
        disp('')
        X = Xi .+ delta_X;
        Xi = X;
    end
end
