function x = fgauss(n,A)

% Escalonamento para transformar A em U (triangular superior)
% Troca de linhas e escolhe a melhor linha para o pivô.
    for k = 1: n-1
        for i = k+1: n
            A = pivot_parcial(A, n, k)
            aux = A(i, k)/A(k, k)
            
            for j = k+1: n+1
                    A(i, j) = A(i, j) - aux * A(k, j); % Lx <- Lx - aux * Ly
            end
            A(i, k) = 0;    % Zerar abaixo da DP
        end
    end
    
% Retrosubstituição:
% O ultimo X e o primeiro a ser calculado

    aux_abs = abs(A(n, n));
    if(aux_abs < 1e-15)
        if(abs(A(n, n+1)) < 1e-15)
            x(n) = 0; "Sistema Possivel Indeterminado"
        else
            x(n) = NaN; "Sistema Impossivel"
        end
    else
        x(n) = A(n, n+1)/A(n, n)
    end
    
    for i = n-1: -1: 1
        soma = 0;
        for j = (i+1): n
            soma = soma + (A(i, j) * x(j));
        end
        i
        x(i) = (A(i, n+1) - soma)/A(i, i);
    end
end
    
