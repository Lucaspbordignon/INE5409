function Roots = fRoots(P)
    grau_n = length(P) - 1;
    k = 0;
    % Salvamento de contexto
    grau_n_original = grau_n;
    P_original = P;

    % Encontrando as raizes
    while (grau_n > 0)
        k++; 
        % Chute inicial. Média entre os raios max. e min.
        Xi(k) = fLocaliza(grau_n, P);

        % Aplicando o metodo de Newton
        % Recebendo a raiz e a multiplicidade
        [X, M] = fNewtonPol(grau_n, P, Xi);

        % Reduzindo o grau
        [grau_n, P] = fReducaoGrau(grau_n, P, X(k), M(k));
    end
end
