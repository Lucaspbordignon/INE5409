function X = fRoots(P)
    grau_n = length(P) - 1;
    k = 0;
    % Salvamento de contexto
    n_original = grau_n;
    p_original = P;

    % Encontrando as raizes
    while (grau_n > 0)
        k++; 
        % Chute inicial. Média entre os raios max. e min.
        Xi(k) = fLocaliza(grau_n, P);

        % Aplicando o metodo de Newton
        % Recebendo a raiz e a multiplicidade
        [X(k), M(k)] = fNewtonPol(grau_n, P, Xi(k));

        [X(k), M(k)] = fNewtonPol(n_original, p_original, X(k));
        % Reduzindo o grau
        [grau_n, P] = fReducaoGrau(grau_n, P, X(k), M(k));
    end
    M
end
