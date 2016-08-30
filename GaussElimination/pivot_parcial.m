function A = pivot_parcial(A, n, k)

% Escolhe a melhor linha k, com o maior pivô em modulo
% Apenas abaixo da DP
maior = abs(A(k,k));    % Elemento da DP
imaior = k;
for i = k+1: n
    aux = abs(A(i,k));
    if(aux > maior)
        "Ocorreu pivotação"
        maior = aux; 
        imaior = i;
    end
end
copy = A(k, :);
A(k, :) = A(imaior, :);
A(imaior, :) = copy;
end