unit LQA.Case07_01_TakeTheStairs;

{**
  有个小孩正在上楼梯，楼梯有n阶台阶，小孩一次可以上1阶、2阶、3阶。
  请实现一个方法，计算小孩有多少种上楼的方式。
  为了防止溢出，请将结果 Mod 1000000007

  给定一个正整数int n，请返回一个数，代表上楼的方式数。
  保证 n小于等于100000。
 *}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Math,
  LQA.Utils;

procedure Main;

implementation

//const
//  FIX = 1000000007;

type
  TRec = function(n: integer): integer;

function Test(n: integer; rec: TRec): UString;
var
  beginTime, endTime: cardinal;
  i: integer;
begin
  beginTime := TThread.GetTickCount64;
  i := rec(n);
  endTime := TThread.GetTickCount64;

  Result := i.ToString + '  Total Time : '
    + ((endTime - beginTime) / 1000).ToString + ' s';
end;

function Recursion1(n: integer): integer;
begin
  if n < 0 then
    Exit(0);
  if (n = 0) or (n = 1) then
    Exit(1);
  if n = 2 then
    Exit(2);

  //Result := Recursion1(n - 1) mod FIX + Recursion1(n - 2) mod FIX
  //  + Recursion1(n - 3) mod FIX;

  Result := Recursion1(n - 1) + Recursion1(n - 2) + Recursion1(n - 3);
end;

function Recursion2(n: integer): integer;
var
  x1, x2, x3, i, tmp: integer;
begin
  if n < 0 then
    Exit(0);
  if (n = 0) or (n = 1) then
    Exit(1);
  if n = 2 then
    Exit(2);
  if n = 3 then
    Exit(4);


  x1 := 1;
  x2 := 2;
  x3 := 4;

  for i := 4 to n do
  begin
    tmp := x1;
    x1 := x2;
    x2 := x3;
    x3 := (x1 + x2 + tmp);
  end;

  Result := x3;
end;

function Recursion3(n: integer): integer;
var
  base, f1f2f3: TArr2D_int;
begin
  base := [
    [0, 0, 1],
    [1, 0, 1],
    [0, 1, 1]];

  f1f2f3 := [[1, 2, 4]];

  Result := TMath.MatrixMultiply(f1f2f3, TMath.MatrixPower(base, n - 1))[0, 0];
end;

procedure Main;
var
  n: integer;
begin
  n := 25;

  WriteLn('Recursion1: ', Test(n, @Recursion1));
  WriteLn('Recursion2: ', Test(n, @Recursion2));
  WriteLn('Recursion3: ', Test(n, @Recursion3));
end;

end.