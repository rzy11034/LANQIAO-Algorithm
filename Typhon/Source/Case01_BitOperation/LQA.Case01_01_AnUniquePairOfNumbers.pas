unit LQA.Case01_01_AnUniquePairOfNumbers;

{$mode objfpc}{$H+}

interface

uses
  LQA.Utils;

procedure Main;

implementation

// 唯一成对的数
procedure AnUniquePairOfNumbers;
var
  n, index, i, x: integer;
  arr, tmpArr: TArr_int;
begin
  n := 11;
  SetLength(arr, n);

  for i := 0 to N - 1 do
    arr[i] := i + 1;

  // 最后一个数，是随机数
  Randomize;
  arr[High(arr)] := Random(n) + 1;
  index := Random(n);  // 随机下标

  TUtils_int.Swap(arr[index], arr[High(arr)]);

  for i := 0 to High(arr) do
    Write(arr[i], ' ');
  WriteLn;

  x := 0;
  for i := 1 to n - 1 do
    x := x xor i;
  for i := 0 to n - 1 do
    x := x xor arr[i];
  WriteLn(x);

  WriteLn('=================================================');

  SetLength(tmpArr, n);
  for i := 0 to n - 1 do
    tmpArr[arr[i]] += 1;

  for i := 0 to High(tmpArr) do
    Write(tmpArr[i], ' ');
  WriteLn;

  for i := 0 to n - 1 do
  begin
    if tmpArr[i] = 2 then
    begin
      WriteLn(i);
      Break;
    end;
  end;
end;

procedure Main;
begin
  AnUniquePairOfNumbers;
end;

end.
