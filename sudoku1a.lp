% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Setting the sudoku board size
size(4).

% Setting the columns, rows, and numbers (in each cell)
col(1..4).
row(1..4).
num(1..4).

% Making sure each cell has only one number
1 { sudoku(X, Y, N) : num(N) = 1 :- col(X), row(Y).

% Making sure each number shows up in each column
:- sudoku(X1, Y, N), sudoku(X2, Y, N), X1 != X2.

% Making sure each number shows up in each row
:- sudoku(X, Y1, N), sudoku(X, Y2, N), Y1 != Y2.

#show sudoku/3.
