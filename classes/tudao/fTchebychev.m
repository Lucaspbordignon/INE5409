function b = fTchebychev(k)
    % Método de tchebyshev
    % Transformação de X para T em [-1, 1] -> X(t) = 0.5(b - a)*T + 0.5(b + a)
    m = 10;

    % Xj = cos((2j - 1)*pi/2m)
    for j = 1 : m
        % Nós de tchebyshev
        teta = ((2*j-1)/(2*m)) * pi;
        t(j) = cos(teta);
    end

    % Achando o primeiro B.
    % T0
    b(1) = 0;
    for j = 1 : m
        % Integral de tchebyshev
        b(1) = b(1) + f(t(j));
    end
    b(1) = b(1)/m;

    % Achando o segundo B.
    % T1
    b(2) = 0;
    for j = 1 : m
        % Integral de tchebyshev
        b(2) = b(2) + f(t(j)) * t(j);
    end
    b(2) = b(2) * (2/m);

    % Achando o terceiro B.
    % T2
    b(3) = 0;
    for j = 1 : m
        % Integral de tchebyshev
        b(3) = b(3) + f(t(j)) * ( 2*(t(j))^2 - 1 );
    end
    b(3) = b(3) * (2/m);

    % Achando o quarto B.
    % T3
    b(4) = 0;
    for j = 1 : m
        % Integral de tchebyshev
        b(4) = b(4) + f(t(j)) * ( 4*(t(j))^3 - 3*t(j) );
    end
    b(4) = b(4) * (2/m);

    % Para uso futuro
        %T4 = (8t^4-8t^2+1)
        i = 4;
        soma = 0;
        for j = 1 : m
            soma = soma+f(t(j))*(8*t(j)^4-8*t(j)^2+1);
        end
        b(i+1) = 2/m*soma;
        
        %T5=(16t^5-20t^3+5t)
        i=5;
        soma=0;
        for j=1:m
            soma=soma+f(t(j))*(16*t(j)^5-20*t(j)^3+5*t(j));
        end
        b(i+1)=2/m*soma;
    
       %T6=(32t^6-48t^4+18t^2-1)
        i=6;
        soma=0;
        for j=1:m
            soma=soma+f(t(j))*(32*t(j)^6-48*t(j)^4+18*t(j)^2-1);
        end
        b(i+1)=2/m*soma;
    
        %    i=7;
    %    soma=0;
    %    for j=1:m
    %        soma=soma+fx0(t(j))*(64*t(j)^7-112*t(j)^5+56*t(j)^3-7*t(j));
    %    end
    %    b(i+1)=2/m*soma;
    %
    %    i=8;
    %    soma=0;
    %    for j=1:m
    %        soma=soma+fx0(t(j))*(128*t(j)^8-256*t(j)^6+160*t(j)^4-32*t(j)^2+1);
    %    end
    %    b(i+1)=2/m*soma;
    %
    %    i=9;
    %    soma=0;
    %    for j=1:m
    %        soma=soma+fx0(t(j))*(256*t(j)^9-576*t(j)^7+432*t(j)^5-120*t(j)^3+9*t(j));
    %    end
    %    b(i+1)=2/m*soma;
    %
    %    i=10;
    %    soma=0;
    %    for j=1:m
    %        soma=soma+fx0(t(j))*(512*t(j)^10-1280*t(j)^8+1120*t(j)^6-400*t(j)^4+50*t(j)^2-1);
    %    end
    %    b(i+1)=2/m*soma;
    %
    %    i=11;
    %    soma=0;
    %    for j=1:m
    %        soma=soma+fx0(t(j))*(1024*t(j)^11-2816*t(j)^9+2816*t(j)^7-1232*t(j)^5+220*t(j)^3-11*t(j));
    %    end
    %    b(i+1)=2/m*soma;
end
