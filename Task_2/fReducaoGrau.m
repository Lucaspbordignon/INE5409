function [grau_n, P] = fReducaoGrau(grau_n, P, X, M)
    for num_divisoes = 1: M
        b(1) = P(1);
        for i = 2: grau_n+1
            b(i) = P(i) + X * b(i-1);
        end
        grau_n = grau_n-1;
        P = b;
    end
    aux = P(1 : grau_n+1);
    P = aux;
end
