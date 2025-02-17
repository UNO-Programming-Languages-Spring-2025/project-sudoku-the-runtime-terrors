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

#show sudoku/3.
