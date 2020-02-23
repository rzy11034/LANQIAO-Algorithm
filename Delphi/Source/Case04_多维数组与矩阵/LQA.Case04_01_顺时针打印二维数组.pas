unit LQA.Case04_01_顺时针打印二维数组;
{ **
  * 顺时针打印二维数组
  输入
  1   2    3    4
  5   6    7    8
  9   10   11   12
  13  14   15   16
  输出
  1 2 3 4 8 12 16 15 14 13 9 5 6 7 11 10
  * }

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

procedure Print2D(matrix: TArr2D_int);
var
  leftRow, leftCol, rightRow, rightCol, r, c: integer;
begin
  leftRow := 0;
  leftCol := 0;
  rightRow := Length(matrix) - 1;
  rightCol := Length(matrix[0]) - 1;

  while (leftRow <= rightRow) and (leftCol <= rightCol) do
  begin
    // 上面一条边
    r := leftRow;
    c := leftCol;
    while c <= rightCol do
    begin
      Write(matrix[r, c], ' ');
      Inc(c);
    end;

    //右边的一条边
    Inc(r);
    c := rightCol;
    while r <= rightRow do
    begin
      Write(matrix[r, c], ' ');
      Inc(r);
    end;

    // 下面一条边
    r := rightRow;
    Dec(c);
    while c >= leftCol do
    begin
      Write(matrix[r, c], ' ');
      Dec(c);
    end;

    // 左边一条边
    Dec(r);
    c := leftCol;
    while r > leftRow do
    begin
      Write(matrix[r, c], ' ');
      Dec(r);
    end;

    Inc(leftRow);
    Inc(leftCol);
    Dec(rightRow);
    Dec(rightCol);
  end;
end;

procedure Main;
var
  matrix: TArr2D_int;
begin
  matrix := [
    [001, 002, 003, 004],
    [005, 006, 007, 008],
    [009, 010, 011, 012],
    [013, 014, 015, 016]];

  TArrayUtils_int.Print2D(matrix);

  Print2D(matrix);
  WriteLn;
end;

end.
