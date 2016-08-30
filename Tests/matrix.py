import numpy as np

matrix = [[np.pi,       np.e,           np.sqrt(2),         2*np.pi, 1],
          [np.sqrt(3),  np.sqrt(10),    -1/np.sqrt(3),      3,      2],
          [np.e,        -(np.sqrt(2)),  1/(np.sqrt(10)),    -1/2,   3],
          [43,          1/2,            np.sqrt(9),         19,     -1]]

# matrix = [[1, 1, 1, 3],
#          [1, 1, 2, 4],
#          [1, 2, 1, 4]]

# matrix = [[2, 2, 2, 20],
#          [2, -2, 2, 8],
#          [0, 0, 0, 2]]

# matrix = [[1, 2, -1, 2],
#          [1, 1, 1, 6],
#          [2, -1, 1, 3]]


def fgauss(matrix):
    """ Gauss Elimination Method implemented for any given matrix.  """
    size = len(matrix)
    for k in range(size-1):
        for i in range(k+1, size):
            matrix = partial_pivot(matrix, size, k)
            aux = matrix[i][k]/matrix[k][k]
            for j in range(k+1, size+1):
                matrix[i][j] = matrix[i][j] - aux * matrix[k][j]
            matrix[i][k] = 0.00000
            matrix_show(matrix)
    matrix_show(matrix, "Final format:\n ")


def matrix_show(matrix, word=''):
    """ Print the matrix with the right format. """
    print(word)
    for i in matrix:
        print('[ ', end='')
        for j in i:
            print("%.5f " % j, end='')
        print(" ]\n")


def partial_pivot(matrix, size, col):
    """ Choose the best line to use the Gauss Elimination Method.
     Consists in choose the large number under the main diagonal
     in absoluto value. Makes the Gauss methods faster.
    """
    large = np.abs(matrix[col][col])
    large_index = col
    for i in range(col+1, size):
        aux = np.abs(matrix[i][col])
        if(aux > large):
            print("Pivoting happened.")
            large, large_index = aux, i
    return copy_line(matrix, col, large_index)


def copy_line(matrix, line1, line2):
    """ Change the position of two rows of a given matrix. """
    copy = matrix[line1]
    matrix[line1] = matrix[line2]
    matrix[line2] = copy
    return matrix


def back_substitution(matrix, size):
    """ Solves the linear system from the last alpha to the
    the first, or, from the 'bottom' to the 'top'.
    """
    result = []
    aux_abs = np.abs(matrix[size][size])
    if(aux_abs < 1e-15):    # Number next to zero
        if(np.abs(matrix[size][size+1]) < 1e-15):
            print("This linear system is called SPI.")
            return
        else:
            print("This linear system has no solution.")
            return
    else:
        print("Solution:")
        result.append(matrix[size][size+1]/matrix[size][size])

    for i in range(size-1, -1, -1):
        sum = 0
        for j in range(i+1, size+1):
            sum += matrix[i][j] * result[j-3]
        result.append((matrix[i][size+1] - sum)/matrix[i][i])
    for i in result:
        print(i)


if __name__ == '__main__':
    matrix_show(matrix)
    fgauss(matrix)
    back_substitution(matrix, len(matrix)-1)
