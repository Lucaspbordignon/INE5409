function M = fMultiplicidade(Resto, Rlim)
    % Multiplicidade = Nº de restos nulos.
    M = 1;
    soma = Resto(1) + Resto(2);
    while (soma < Rlim)
        M++;
        soma += abs(Resto(M+1));
    end
end
