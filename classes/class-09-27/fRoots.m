function X = fRoots(A)
    % Grau do polinomio. (n)
    grau = length(A) - 1;

    % Normalizando o A
    for i=2: grau+1
        A(i) = A(i)/A(1);
    end
    A(1) = 1;

    A_original = A;
    grau_original = grau;
    k = 0;
    while (grau > 0)
        k = k + 1;  % Primeira raiz.
        Xi(k) = fLocaliza(grau, A);

        Xi(k) = 1.1
        [X(k), M(k)] = fNPolinomios(grau, A, Xi(k));

        % Purificação da raiz X(k) encontrada
        [X(k), M(k)] = fNPolinomios(grau_original, A_original, X(k));

        % Redução de grau pela raiz X, 'grau' vezes.
        [grau, A] = fReducaoGrau(grau, A, X(k), M(k));
    end
end
