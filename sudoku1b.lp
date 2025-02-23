% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Setting the sudoku board size to 4x4
#const grid = 4.  

% Setting the subgrid board size within the main grid
#const subgridsize = 2.

% Setting up the cells in a 4x4 board
cell(RowPos, ColPos) :- RowPos = 1..grid, ColPos = 1..grid.

% Find the cells subgrid
subgrid(Row, Column, Subgrid) :-
    cell(Row, Column),
    RowPos = (Row - 1) / subgridsize,
    ColPos = (Column - 1) / subgridsize,
    Subgrid = 1 + RowPos * subgridsize + ColPos.

% Making sure each cell has only one number
1 { sudoku(Row, Column, CellValue) : CellValue = 1..grid } 1 :- cell(Row, Column).

% Making sure that the initial state of the grid stays as set using negation to verify
:- initial(Row, Column, CellValue), not sudoku(Row, Column, CellValue).

% Making sure each row has a unique number
:- sudoku(Row, Column1, CellValue), sudoku(Row, Column2, CellValue), Column1 != Column2.

% Making sure each column has a unique number
:- sudoku(Row1, Column, CellValue), sudoku(Row2, Column, CellValue), Row1 != Row2.

#show sudoku/3.
#show subgrid/3.