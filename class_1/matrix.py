import numpy as np

matrix = [[np.pi,       np.e,           np.sqrt(2),         2*np.pi, 1],
          [np.sqrt(3),  np.sqrt(10),    -1/np.sqrt(3),      3,      2],
          [np.e,        -(np.sqrt(2)),  1/(np.sqrt(10)),    -1/2,   3],
          [43,          1/2,            np.sqrt(9),         19,     -1]]


def fgauss(matrix):
    """ Gauss Elimination Method implemented for any given matrix.  """
    size = len(matrix)
    for k in range(size):
        for i in range(k+1, size):
            for j in range(k+1, size+1):
                aux = matrix[i][k]/matrix[k][k]
                matrix[i][j] = round(matrix[i][j] - aux * matrix[k][j], 4)
            matrix[i][k] = 0.00000
    matrix_show(matrix)


def matrix_show(matrix):
    """ Print the matrix with the right format. """
    for i in matrix:
        print('[ ', end='')
        for j in i:
            print("%.5f " % j, end='')
        print(" ]\n")

if __name__ == '__main__':
    fgauss(matrix)
