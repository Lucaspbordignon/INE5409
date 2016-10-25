function Xi = fLocaliza(n, A)
    raio_maximo = 1 + max(abs(A(2:n+1))) / abs(A(1));

    % Calculo do raio minimo.
    raio_minimo = 1/(1 + max(abs(A(1:n)))/abs(A(n+1) ));

    Xi = (raio_maximo + raio_minimo)/2;
end
