function x = fNewton(Xi, tol)
    x = Xi;
    diferenca = 1;
    passos = 0;

    lambda = 0.65;
    aux_lambda = (1 - lambda);

    while (diferenca > tol && passos < 100) 
        
        x = x - f(x) / f_derivada(x);
        
        diferenca = abs(x - Xi);
        Xi = x;
        passos++;
    end
    x
    passos
end

