function coeficientes = fPolyInterpolacao(X, Y, N)
% Aproximando uma função f(x) continua em [a,b]
    for i = 1: N+1
        % Escrevendo na forma matricial
        % a1 + a2*x1 + a3*x1² + ... + a(n+1)*x1^n = y1
        A(i, 1) = 1;
        A(i, 2) = X(i);
        for j = 3: N+1
            A(i, j) = A(i, j-1) * X(i);
        end
        A(i, N+2) = Y(i);
    end
    A
    % Resolvendo o sistema
    coeficientes = fgauss(N+1, A);
end
