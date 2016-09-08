function GaussSolutionPivoted = GaussPivotado(N, A)

NumeroOperacoes = 0;
% Escalonando a matrix A
for k = 1: N-1
    for i = k+1: N
        A = PivotPartial(N, A, k);
        aux = A(i, k)/A(k, k);
        NumeroOperacoes += 1;
        for j = k+1 : N+1
            A(i, j) = A(i, j) - aux * A(k, j);
            NumeroOperacoes += 2;   % Multiplicacao e subtracao.
        end
        A(i, k) = 0;    % Zera abaixo da DP.
    end
end

% Aplicando a retrosubstituicao
% O ultimo X e o primeiro a ser calculado.

aux_abs = abs(A(N, N));     % Ultimo X.
if (aux_abs < 1e-15)
    if (abs(A(N, N+1)) < 1e-15)
        GaussSolutionPivoted(N) = 0; "Sistema Possivel Indeterminado."
    else
        GaussSolutionPivoted(N) = NaN; "Sistema Impossivel."
    end
else
    GaussSolutionPivoted(N) = A(N, N+1)/A(N, N);
    NumeroOperacoes += 1;
end

% Calculando os outros elementos
for i = N-1: -1: 1      % Reduzindo de 1 em 1.
    Sum = 0;
    for j = i+1: N
        Sum = Sum + (A(i, j) * GaussSolutionPivoted(j));
        NumeroOperacoes += 2;   % Multiplicacao e soma;
    end
    GaussSolutionPivoted(i) = (A(i, N+1) - Sum)/A(i, i);
    NumeroOperacoes += 2;   % Subtracao e divisao.
end

% Mostra o numero de operacoes de ponto flutuante realizadas.
NumeroOperacoes

% Function end.
end
