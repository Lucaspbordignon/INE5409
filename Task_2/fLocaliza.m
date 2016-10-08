function Xi = fLocaliza(grau_n, P)
    % Calcula os raios maximo e minimo e retorna um valor medio entre eles
    raio_maximo = 1 + max(abs(P(2:grau_n+1))) / abs(P(1));
    raio_minimo = 1/(1 + max(abs(P(1:grau_n)))/abs(P(grau_n+1) ));
    Xi = (raio_maximo + raio_minimo)/2;
    %Xi = complex(raio_medio*cos(pi/4), raio_medio*sin(pi/4));
end
