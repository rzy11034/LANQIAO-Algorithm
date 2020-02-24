unit LQA.Case04_04_MaxSquare;

{**
 *  给定一个N×N的矩阵matrix，在这个矩阵中，只有0和1两种值，
    返回边框全是1的最大正方形的边长长度。 
 　 例如： 
    [0, 1, 1, 1, 1],
    [0, 1, 0, 0, 1],
    [0, 1, 0, 0, 1],
    [0, 1, 1, 1, 1],
    [0, 1, 0, 1, 1]　
 　其中，边框全是1的最大正方形的大小是4*4，返回4
 *}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

function GenerateAux(const matrix: TArr2D_int): TArr3D_int;
var
  rowCount, colCount, i, j: integer;
  ret: TArr3D_int;
begin
  rowCount := Length(matrix);
  colCount := Length(matrix[0]);
  SetLength(ret, rowCount, colCount, 2);

  for i := rowCount - 1 downto 0 do
  begin
    for j := colCount - 1 downto 0 do
    begin
      //ret[i][j];
    end;
  end;

end;

function MaxSquare(const matrix: TArr2D_int; const aux: TArr3D_int): integer;
var
  rowCount, colCount, i, j: integer;
begin

end;

// 枚举法————O(n³)
function MaxSquare(const matrix: TArr2D_int): integer;
label
  L3;
var
  len, n, r, c, i, j: integer;
  flag: boolean;
begin
  len := Length(matrix);
  n := len; // n代表最大正方形的边长长度

  // 从最大正方形的边长长度开始枚举
  while n > 0 do
  begin
    for i := 0 to len - 1 do
    begin

      for j := 0 to len - 1 do
      begin
        r := i;
        c := j;

        while c < j + n do
        begin
          if matrix[r][c] = 0 then
          begin
            goto L3;
          end;
        end;
      end;

      L3: Continue;
    end;
  end;
end;

procedure Main;
var
  matrix: TArr2D_int;
  aux: TArr3D_int;
begin
  matrix := [
    [0, 1, 1, 1, 1],
    [0, 1, 0, 0, 1],
    [0, 1, 0, 0, 1],
    [0, 1, 1, 1, 1],
    [0, 1, 0, 1, 1]];
end;

end.