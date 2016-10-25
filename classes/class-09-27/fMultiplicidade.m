function M = fMultiplicidade(Resto)
    % Multiplicidade = Nº de restos nulos (menores que 1e-4).
    Rlimite = 1e-4;
    M = 1;
    soma = abs(Resto(1)) + abs(Resto(2));
    while (soma < Rlimite)
        M++;
        soma = soma + abs(Resto(M+1));
    end
end
