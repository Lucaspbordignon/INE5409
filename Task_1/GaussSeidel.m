function GaussSeidelSolution = GaussSeidel(N, A, Xi, criterioParada)
 
    max_dif = 1;
    lambda = 1.00505    % Sobrerelaxacao.
    lambda_aux = (1 - lambda);
    NumeroOperacoes = 1;    % (1 - lambda) foi a primeira.   
    % Chute inicial.
    X = Xi;
    
    while(max_dif > criterioParada)
        X(1) = lambda_aux*Xi(1) + lambda * ((A(1, N+1) - X(2))/A(1, 1));
        NumeroOperacoes += 5;   % Subtracao, divisao, soma e 2 multiplicacoes.
        
        for I = 2: N/2
            X(I) = lambda_aux*Xi(I) + lambda * ((A(I, N+1) - A(I, I-1)*X(I-1) 
                    - X(I+1) - X(I+N/2))/A(I, I));
            NumeroOperacoes += 8;    % 2 Multiplicacoes, 3 subtracoes, soma e divisao.
        end
        
        for I = (N/2)+1: N-1
            X(I) = lambda_aux*Xi(I) + lambda * ((A(I, N+1) - A(I, I-N/2)*X(I-(N/2)) 
                                    - A(I, I-1)*X(I-1) - X(I+1))/A(I, I));   
            NumeroOperacoes += 9;    % 4 Multiplicacoes, 3 subtracoes, soma e divisao.
        end
        
        X(N) = lambda_aux*Xi(I) + lambda * ((A(N, N+1) - A(I, I-1)*X(I-1))/A(N, N));
        NumeroOperacoes += 6;   % 3 Multiplicacoes, subtracao, soma e divisao.
        
        % Recalculando o criterio de parada(max_dif).
        max_dif = max(abs(X .- Xi));
        Xi = X;
    end
    
    % 'Retorna' a solucao final (X).
    GaussSeidelSolution = X;
    % Mostra o numero final de operacoes.
    NumeroOperacoes
   

    % Calculo de uma solucao "mais exata", para calculo do erro.
    X_erro = X;
    while(max_dif > (criterioParada)^2) 
        X_erro(1) = lambda_aux*Xi(1) + lambda * ((A(1, N+1) - X_erro(2))/A(1, 1));
            
        for I = 2: N/2
            X_erro(I) = lambda_aux*Xi(I) + lambda * ((A(I, N+1) - A(I, I-1)*X_erro(I-1) 
                    - X_erro(I+1) - X_erro(I+N/2))/A(I, I));
        end
        
        for I = (N/2)+1: N-1
            X_erro(I) = lambda_aux*Xi(I) + lambda * ((A(I, N+1) - A(I, I-N/2)*X_erro(I-(N/2)) 
                                    - A(I, I-1)*X_erro(I-1) - X_erro(I+1))/A(I, I));   
        end
        
        X_erro(N) = lambda_aux*Xi(I) + lambda * ((A(N, N+1) - A(I, I-1)*X_erro(I-1))/A(N, N));
        
        max_dif = max(abs(X_erro .- Xi));
        Xi = X_erro;
    end
    
    % Calcula e imprime na tela o maior erro.
    ErroMaximoGaussSeidel = max(abs(X_erro .- X))
    
end
