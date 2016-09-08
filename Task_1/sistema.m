% Usando dupla precisao.
format long
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


% Letra A)
disp("\nLetra A)")
% Calculo da solucao do sistema por Gauss, sem pivotacao.
GaussSolution = Gauss(N, A);
% Residuo
Residuo = ResiduoFunc(N, A, GaussSolution)
ErroDeTruncamento = 0.0


% Letra B)
disp("\nLetra B)")
% Calculo da solucao do sistema por Gauss, com pivotacao.
GaussSolutionPivoted = GaussPivotado(N, A);
% Residuo
ResiduoGaussPivotado = ResiduoFunc(N, A, GaussSolutionPivoted)


% Letra C)
if(Residuo > ResiduoGaussPivotado)
    disp("\nLetra C)   A solução COM pivotação é mais exata.")
else
    disp("\nLetra C)   A solução SEM pivotação é mais exata.")
end


% Letra D)
disp("\nLetra D)")
% Chute inicial.
for i = 1: N
    Xi(i) = 0.0;
end
% Calculo da solucao do sistema iterativamente, por Jacobi.
JacobiSolution = Jacobi(N, A, Xi, 1e-4);


%Letra E)
disp("\nLetra E)")
% Calculo da solucao do sistema iterativamente, por Gauss-Seidel.
GaussSeidelSolution = GaussSeidel(N, A, Xi, 1e-4);



% Exibindo os resultados.
disp("\n---------------------------------------------------------------")
% Letra B
disp("\nSolução por Gauss, COM pivotação: \n")
GaussSolutionPivoted
% Letra E
disp("\nSolução por Gauss-Seidel, com fator de sobrerelaxação: \n")
GaussSeidelSolution
