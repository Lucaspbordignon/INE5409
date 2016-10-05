function [grau_n, P] = fReducaoGrau(grau_n, P, X, M)
    N = grau_n;
    for num_divisoes = 1: M
        b(1) = P(1);
        for i = 2: grau_n+1
            b(i) = P(i) + X * b(i-1);
        end
        R(num_divisoes) = b(grau_n+1);
        P = b(1:grau_n);
        grau_n = grau_n-1;
    end
end
