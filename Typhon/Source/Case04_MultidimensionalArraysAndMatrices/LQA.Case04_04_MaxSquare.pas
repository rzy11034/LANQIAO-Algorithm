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
  SetLength(aux, rowCount, colCount, 2);

  for i := rowCount - 1 downto 0 do
  begin
    for j := colCount - 1 downto 0 do
    begin
      aux[i][j];
    end;
  end;

end;

function MaxSquare(const matrix: TArr2D_int; const aux: TArr3D_int): integer;
var
  rowCount, colCount, i, j: integer;
begin

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