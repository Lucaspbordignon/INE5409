format long

1º passo: localizar xi
#x=1:0.1:2;
#y=x .* log(x)-1;
#plot(x,y)
#grid on
xi=1.5 %definido via grafico

%2º passo: aproximar x com erro controlado pelo 'tol'
tol=1e-6
x=fmil(xi,tol)

%calculo do erro:
xe=fmil(x,tol^2); %valor exato estimado
Errox=abs(x-xe)



x = [0: 0.1: 5 * pi]
y_1 = tan(x);
y_2 = 1 ./ x;

plot(x, y_1, 'b', x, y_2, 'r', width, '20')


function x = fTg(x)
    x = tan(x) - 1;
end
