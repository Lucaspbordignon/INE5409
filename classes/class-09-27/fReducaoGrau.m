function [grau, A] = fReducaoGrau(grau, A, X, M)
    % Usar fRestos controladamente
    n = grau;
    for ndiv = 1 : M %divide M vezes
        b(1) = A(1);
        for i = 2 : n+1
            b(i) = A(i) + X*b(i-1);
        end
        R(ndiv) = b(n+1);
        A = b(1:n);
        n = n-1;
    end
end
