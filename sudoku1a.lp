% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Setting the sudoku board size
#const n = 4.

% Setting up the cells in a 4x4 board
cell(X, Y) :- X = 1..n, Y = 1..n.

% Making sure each cell has only one number
N1 = N2 :- sudoku(X1, Y1, N1), initial(X2, Y2, N2), X1 = X2, Y1 = Y2.

% Setting the initial state of the grid (initial(X,Y,N). % initially cell [X,Y] contains number N)
sudoku(X, Y, N) :- initial(X, Y, N).

% Making sure each column has a unique number
:- sudoku(X1, Y, N), sudoku(X2, Y, N), X1 != X2, N1 = N2.

% Making sure each row has a unique number
:- sudoku(X, Y1, N), sudoku(X, Y2, N), Y1 != Y2, N1 = N2.

#show sudoku/3.
