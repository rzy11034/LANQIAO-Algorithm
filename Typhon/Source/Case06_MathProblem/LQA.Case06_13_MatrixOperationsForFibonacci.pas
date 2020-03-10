unit LQA.Case06_13_MatrixOperationsForFibonacci;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils,
  LQA.DSA.Math;

procedure Main;

implementation

// 矩阵运算求解斐波那契
function Fib(n: integer): integer;
var
  matrix, ret: TArr2D_int;
begin
  if (n = 1) or (n = 2) then
    Exit(1);

  matrix := [[0, 1], [1, 1]];

  ret := TMath.MatrixPower(matrix, n - 1); // 乘方
  ret := TMath.MatrixMultiply([[1, 1]], ret); // 矩阵相乘
  Result := ret[0][0];
end;

procedure Main;
var
  i: integer;
begin
  for i := 1 to 9 do
    Write(fib(i), ' ');
  WriteLn;
end;

end.
