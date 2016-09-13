function JacobiSolution = Jacobi(N, A, Xi, criterioParada)

    NumeroOperacoes = 0;    
    max_dif = 1;
    
    while(max_dif > criterioParada)
        JacobiSolution(1) = (A(1, N+1) - Xi(2))/A(1, 1);
        NumeroOperacoes += 2;   % Subtracao e divisao.
        
        for I = 2: N/2
            JacobiSolution(I) = (A(I, N+1) - A(I, I-1)*Xi(I-1) - Xi(I+1) 
                                    - Xi(I+N/2))/A(I, I);
            NumeroOperacoes += 5;    % Multiplicacao, 3 subtracoes e divisao.
        end
        
        for I = (N/2)+1: N-1
            JacobiSolution(I) = (A(I, N+1) - A(I, I-N/2)*Xi(I-(N/2)) 
                                    - A(I, I-1)*Xi(I-1) - Xi(I+1))/A(I, I);   
            NumeroOperacoes += 6;    % 2 Multiplicacoes, 3 subtracoes e divisao.
        end
        
        JacobiSolution(N) = (A(N, N+1) - A(I, I-1)*Xi(I-1))/A(N, N);
        NumeroOperacoes += 3;   % Multiplicacao, subtracao e divisao.
        
        % Recalculando o criterio de parada(max_dif).
        max_dif = max(abs(JacobiSolution .- Xi));
        Xi = JacobiSolution;
    end
    
    % Mostra o numero final de operacoes.
    NumeroOperacoes
end
