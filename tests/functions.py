def GaussSeidel(N, sistema):
    for i in range(N):        # Percorre linhas. 0 ate 99
        lista = []
        for j in range(N+1):    # Percorre colunas. 0 ate 100
            lista.append(0)
        sistema.append(lista)


def print_matrix(sistema):
    for i in sistema:
        print(i)
    print('')
