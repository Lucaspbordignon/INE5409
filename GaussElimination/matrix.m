A = [
    pi      e           sqrt(2)     2*pi    1;
    sqrt(3) sqrt(10)    -1/sqrt(3)  3       2;
    e       -sqrt(2)    1/sqrt(10)  -1/2    3;
    43      1/2         sqrt(9)     19      -1;
    ]

n = size(A,1)
x = fgauss(n,A)
rmax = fresiduo(n,A,x)


% Passo 1
%aux2 = A(2,1)/A(1,1);
%A(2, :) = A(2, :) - aux2 * A(1, :);  % L2 <- L2 - aux * L1

%aux3 = A(3,1)/A(1,1);
%A(3, :) = A(3, :) - aux3 * A(1, :);  % L3 <- L3 - aux * L1


% Passo 2

%aux3 = A(3,2)/A(2,2);
%A(3, :) = A(3, :) - aux3 * A(2, :);  % L3 <- L3 - aux * L2

%rmax = fresiduo(n, A, x)