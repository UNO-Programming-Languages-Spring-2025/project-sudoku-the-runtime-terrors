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
{ sudoku(X, Y, N) : N = 1..n } = 1 :- cell(X, Y).

% Making sure each number shows up in each column
:- sudoku(X1, Y, N), sudoku(X2, Y, N), X1 != X2.

% Making sure each number shows up in each row
:- sudoku(X, Y1, N), sudoku(X, Y2, N), Y1 != Y2.

#show sudoku/3.
