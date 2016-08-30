format long     % Usando dupla precisao(64 bits)

xi = [0 0 0]    % Chute inicial
x = xi;         % Valor inicial da variavel final
max_dif = 1;
iteration_num = 0;
lambda = 0.8;

while max_dif > 1e-4 && iteration_num < 100
    % Isolando e resolvendo as variaveis
    % Metodo de gauss-seidel
    x(1) = ( (1 - lambda) * xi(1) ) + ( lambda * (1 + x(2) + x(3))/3 );     % Usando fator de relaxação
    x(2) = ( (1 - lambda) * xi(2) ) + ( lambda * (5 - x(1) - x(3))/3 );
    x(3) = ( (1 - lambda) * xi(3) ) + ( lambda * (4 - 2*x(1) + 2*x(2))/4 );
    %
    max_dif = max(abs(x - xi));  % Criterio de parada
    iteration_num += 1;  % Iteracao atual
    xi = x;
    xp(iteration_num) = iteration_num;
    yp(iteration_num) = x(1);
end
x
iteration_num
max_dif


% Simulacao da solucao exata
xe = x;
while max_dif > 1e-8 && iteration_num < 100
    % Isolando e resolvendo as variaveis
    xe(1) = (1 + xe(2) + xe(3))/3;
    xe(2) = (5 - xe(1) - xe(3))/3;
    xe(3) = (4 - 2*xe(1) + 2*xe(2))/4;
    %
    max_dif = max(abs(xe - xi));  % Criterio de parada
    iteration_num += 1;  % Iteracao atual
    xi = xe;
end
xe
iteration_num
max_dif

erro = abs(x - xe)
erro_maximo = max(erro)

plot(xp, yp)