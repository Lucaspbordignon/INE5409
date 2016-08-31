function GaussSolution = Gauss(N, A)

% Escalonando a matrix A
for k = 1: N-1
    for i = k+1: N
        aux = A(i, k)/A(k, k);
        for j = k+1 : N+1
            A(i, j) = A(i, j) - aux * A(k, j);
        end
        A(i, k) = 0;    % Zera abaixo da DP.
    end
end

% Aplicando a retrosubstituicao
% O ultimo X e o primeiro a ser calculado.

aux_abs = abs(A(N, N));     % Ultimo X.
if (aux_abs < 1e-15)
    if (abs(A(N, N+1)) < 1e-15)
        GaussSolution(N) = 0; "Sistema Possivel Indeterminado."
    else
        GaussSolution(N) = NaN; "Sistema Impossivel."
    end
else
    GaussSolution(N) = A(N, N+1)/A(N, N);
end

% Calculando os outros elementos
for i = N-1: -1: 1      % Reduzindo de 1 em 1.
    Sum = 0;
    for j = i+1: N
        Sum = Sum + (A(i, j) * GaussSolution(j));
    end
    GaussSolution(i) = (A(i, N+1) - Sum)/A(i, i);
end

% Function end.
end
