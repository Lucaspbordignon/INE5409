function Resto = fBriotRuffini(grau_n, P, Xi)
    N_aux = grau_n;
    for numero_divisao = 1: N_aux
        b(1) = P(1);
        for i = 2: grau_n+1
            b(i) = P(i) + Xi * b(i-1);
        end
        Resto(numero_divisao) = b(grau_n+1);
        P = b(1:grau_n);
        grau_n--;
    end
    % Ultima divisao. Calculo desnecessario.
    Resto(N_aux+1) = P(1);
end
