unit LQA.Case04_03_ZigPrintMatrix;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

procedure Solution(matrix: TArr2D_int);
var
  r, c, rowBottom, colBottom: integer;
  isL2R: boolean;
begin
  r := 0;
  c := 0;
  rowBottom := Length(matrix);
  colBottom := Length(matrix[0]);
  isL2R := True;

  while (r < rowBottom) and (c < colBottom) do
  begin
    Write(matrix[r, c], ' ');

    // 从左向右打印
    if isL2R then
    begin
      if c = colBottom - 1 then
      begin
        Inc(r);
      end
      else if r = 0 then
      begin
        Inc(c);
      end
      else
      begin
        Dec(r);
        Inc(c);
      end;
    end
    else // 从右向左打印
    begin

    end;
  end;
end;

procedure Main;
var
  matrix: TArr2D_int;
begin
  matrix := [
    [01, 02, 03, 04],
    [05, 06, 07, 08],
    [09, 10, 11, 12]];

  Solution(matrix);
  WriteLn;
end;

end.
