unit LQA.Case04_02_0所在的行列清零;

interface

uses
  LQA.Utils;

procedure Main;

implementation

procedure Solution(matrix: TArr2D_int);
var
  m, n, i, j, row, col: integer;
  rowRecord, colRecord: TArr_int;
begin
  m := Length(matrix);
  n := Length(matrix[0]);

  //记录哪些行出现了0
  SetLength(rowRecord, m);
  //记录哪些列出现了0
  SetLength(colRecord, n);

  for i := 0 to m - 1 do
  begin
    for j := 0 to n - 1 do
    begin
      if (matrix[i][j] = 0) then
      begin
        rowRecord[i] := 1;
        colRecord[j] := 1;
      end;
    end;
  end;

  for row := 0 to m - 1 do
  begin
    for col := 0 to n - 1 do
    begin
      //当前的行或者列，被标记了，这个元素就应该变为0
      if (rowRecord[row] = 1) or (colRecord[col] = 1) then
      begin
        matrix[row][col] := 0;
      end;
    end;
  end;
end;

procedure Main;
var
  matrix: TArr2D_int;
begin
  matrix := [
    [1, 2, 3, 4, 100],
    [5, 6, 7, 0, 101],
    [9, 0, 11, 12, 102],
    [13, 14, 15, 16, 103],
    [104, 105, 106, 107, 103]];

  Solution(matrix);
  TArrayUtils_int.Print2D(matrix);
end;

end.
