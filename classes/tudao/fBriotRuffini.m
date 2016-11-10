function Resto = fBriotRuffini(grau_n, P, Xi)
    P = fliplr(P);
    b(1) = P(1);
    for k = 1: length(Xi)
        for i = 2: grau_n+1
            b(i) = P(i) + (Xi(k) * b(i-1));
        end
        Resto(k) = b(grau_n+1);
    end
end
