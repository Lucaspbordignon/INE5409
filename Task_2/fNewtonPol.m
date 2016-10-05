function [X, M] = fNewtonPol(grau_n, P, Xi)
    dif = 1;
    passo = 0;
    while (dif > 1e-12 && passo < 120)
        passo++;
        % Calculando uma raiz usando o resto das divisoes
        Resto = fBriotRuffini(grau_n, P, Xi);
        M = fMultiplicidade(Resto, 0.1);
        X = Xi - Resto(M)/(M * Resto(M+1));
        % Calculo da nova diferenca
        dif = max(abs(X - Xi)) + abs(Resto(1));
        Xi = X;
    end
end
