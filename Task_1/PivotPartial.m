function A = PivotPartial(N, A, k)

% Escolhe a melhor linha para servir de pivo no escalonamento.
% Considera apenas os elementos abaixo da DP.
    maior = abs(A(k, k));   % Elemento da DP
    maior_index = k;
    for i = k+1: N
        aux = abs(A(i, k));     % Elemento(s) seguinte(s) na mesma coluna
        if(aux > maior)
            maior = aux;
            maior_index = i;
        end
    end
    copy = A(k, :);
    A(k, :) = A(maior_index, :);
    A(maior_index, :) = copy;
end
