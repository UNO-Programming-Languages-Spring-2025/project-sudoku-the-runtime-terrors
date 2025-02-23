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
cell(Row, Col) :- Row = 1..grid, Col = 1..grid.

% Find the cells subgrid
subgrid(Row, Col, Subgrid) :-
    cell(Row, Col),
    RowPos = (Row - 1) / subgridsize,
    ColPos = (Col - 1) / subgridsize,
    Subgrid = 1 + RowPos * subgridsize + ColPos.

% Making sure each cell has only one number
1 { sudoku(Row, Col, CellValue) : CellValue = 1..grid } 1 :- cell(Row, Col).

% Ensure initial CellValues are preserved
:- initial(Row, Col, CellValue), not sudoku(Row, Col, CellValue).

% Each number must appear only once in each row
:- sudoku(Row, Col1, CellValue), sudoku(Row, Col2, CellValue), Col1 != Col2.

% Each number must appear only once in each column
:- sudoku(Row1, Col, CellValue), sudoku(Row2, Col, CellValue), Row1 != Row2.

% Each number must appear only once in each subgrid
:- sudoku(Row1, Col1, CellValue), sudoku(Row2, Col2, CellValue),
   subgrid(Row1, Col1, Subgrid), subgrid(Row2, Col2, Subgrid),
   (Row1, Col1) != (Row2, Col2).

#show sudoku/3.
