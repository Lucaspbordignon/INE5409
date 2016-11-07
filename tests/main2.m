format long

x = [0: 0.1: 5 * pi]
y_1 = tan(x);
y_2 = 1 ./ x;

plot(x, y_1, 'b', x, y_2, 'r', width, '20')


function x = fTg(x)
    x = tan(x) - 1;
end
