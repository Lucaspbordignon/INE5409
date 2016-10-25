function Resto = fBriotRuffini(grau, A, Xi)

    N_aux = grau;
    for numero_divisao = 1: grau
        b(1) = A(1);
        for i = 2 : grau+1
            b(i) = A(i) + Xi * b(i-1);
        end
        Resto(numero_divisao) = b(grau+1);
        A = b(1:grau);
        grau--;
    end
    Resto(N_aux+1) = A(1);
end
