N = 50

% Criando o sistema.
for i = 1: N
    if (i == 1)
        A(i, i) = 3;
        A(i, i+1) = 1;
        A(i, N+1) = 450;

    elseif (i >= 2 && i <= N/2)
        A(i, i-1) = 20;
        A(i, i) = 50;
        A(i, i+1) = 1;
        A(i, i+N/2) = 1;
        A(i, N+1) = 100;

    elseif ( i >= (N/2 + 1) && i <= N-1)
        A(i, i-N/2) = 11;
        A(i, i-1) = 3;
        A(i, i) = 60;
        A(i, i+1) = 1;
        A(i, N+1) = 200;

    else
        A(i, i-1) = 3;
        A(i, i) = 10;
        A(i, N+1) = 300;
    end
end

% Mostra o sistema linear.
A

% Letra A)
% Calculo da solucao so sistema por Gauss, sem pivotacao.
GaussSolution = Gauss(N, A)
