import functions as fn

N = 15
sistema = []

# Cria a matriz inicial, cheia de zeros
fn.GaussSeidel(N, sistema)
fn.print_matrix(sistema)

# Equacao -> X(1) + X(2) = 3        / i = 1
for i in range(N+1):    # de 0 até 100 (0 a 99 + (n+1))
    if(i == 0 or i == 1):
        sistema[0].insert(i, 1)
        sistema[0].pop(N)
    elif(i == N):
        sistema[0].insert(N, 3)
        sistema[0].pop(N+1)

# Equacao -> X(i-1) + X(i) + X(i+!) = 10    / i = 2 : n-1
for i in range(1, N-1):     # 1 até 98 (até o penultimo valor)
    for j in range(N+1):    # cria as linhas da matrix (0 até 100)
        if(j == i-1 or j == i or j == i+1):
            sistema[i].insert(j, 1)
            sistema[i].pop(N)
        elif(j == N):
            sistema[i].insert(N, 10)
            sistema[i].pop(N+1)

# Equacao -> X(n-1) + X(n) = 2      / i = n
for i in range(N+1):
    if(i == N-2 or i == N-1):
        sistema[N-1].insert(i, 1)
        sistema[N-1].pop(N)
    elif(i == N):
        sistema[N-1].insert(N, 2)
        sistema[N-1].pop(N+1)


fn.print_matrix(sistema)
