function Residuo = ResiduoFunc(N, A, GaussSolution)

% Essa funcao retorna o maior residuo, dada a solucao de um sistema.
% Substitui as variaveis X(i) nas equacoes, e compara com o resultado esperado.
    for i = 1: N    % Percorre as linhas.
        sum = 0;
        for j = 1: N    % Percorre as colunas.
            sum += A(i, j) * GaussSolution(j);
        end
        R(i) = abs(sum - A(i, N+1));
    end
    Residuo = max(R);
end
