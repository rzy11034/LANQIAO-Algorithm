unit LQA.Case03_10_RankAllEmployeesByAge;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

procedure CountSort(var arr: TArr_int);
var
  aux: array[1..99] of integer;
  i, e, current: integer;
begin
  for i := 1 to 99 do
    aux[i] := 0;

  for e in arr do
    Inc(aux[e]);

  current := 0;
  for i := 1 to 99 do
  begin
    while aux[i] > 0 do
    begin
      arr[current] := i;
      Inc(current);
      Dec(aux[i]);
    end;
  end;
end;

procedure Main;
var
  arr: TArr_int;
begin
  arr := [7, 8, 5, 8, 9, 3, 2, 1, 6];
  CountSort(arr);
  TArrayUtils_int.Print(arr);
end;

end.
