function Yp = fLagrange(grau, X, Y, Xp)
    for k = 1: length(Xp)
        Yp(k) = 0;
        for i = 1: grau + 1
            aux = 1;
            for j = 1: grau + 1
                if (j != i) aux = aux * (Xp(k) - X(j))/(X(i) - X(j)); end
            end
            Yp(k) = Yp(k) + Y(i)*aux;
        end
    end
end
