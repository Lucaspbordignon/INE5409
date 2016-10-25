function [X, M] = fNPolinomios(grau, A, Xi)

    dif = 1;
    passo = 0;
    while (dif > 1e-14 && passo < 1000)
        passo++;
        passo
        Resto = fBriotRuffini(grau, A, Xi)
        % X = Xi - (Xi^3 - 3*Xi^2 + 3*Xi - 1)/(3*Xi^2 - 6*Xi + 3)
        % Usando o resto.
        M = fMultiplicidade(Resto)
        X = Xi - Resto(M)/(M * Resto(M+1))
        dif = max(abs(X .- Xi)) + abs(Resto(1));
        Xi = X;
        disp('')
    end
end
