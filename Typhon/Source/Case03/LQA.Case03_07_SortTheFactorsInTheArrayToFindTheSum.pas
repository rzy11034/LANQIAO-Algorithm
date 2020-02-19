unit LQA.Case03_07_SortTheFactorsInTheArrayToFindTheSum;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

// 二和因子
procedure Factors_2(arr: TArr_int; k: integer);
var
  l, r: integer;
begin
  l := Low(arr);
  r := High(arr);

  while l < r do
  begin
    if arr[l] + arr[r] < k then
      inc(l)
    else
    if arr[l] + arr[r] > k then
      dec(r)
    else
    begin
      WriteLn('(', arr[l], ', ', arr[r], ')');
      dec(r)
    end;
  end;
end;

procedure Main;
var
  arr: TArr_int;
begin
  arr := [-8, -4, -3, 0, 2, 4, 5, 8, 9, 10];
  Factors_2(arr, 10);
end;

end.