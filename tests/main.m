format long

x = 1: 1: 4;
y = x .* log(x) .- 1;

% plot(x, y)
% grid

Xi = 1.5;


% Metodo da iteracao linear
x = fmil(Xi, 1e-16);


% Metodo de Newton
% Nesse metodo, SEMPRE sera usada a formula:
% X = Xi - f(Xi)/f'(Xi)
x = fNewton(Xi, 1e-15);
