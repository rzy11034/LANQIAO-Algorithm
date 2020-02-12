unit LQA.Case01_01_唯一成对的数;

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

// 唯一成对的数
procedure AnUniquePairOfNumbers;
var
  n, index, i, x: integer;
  arr, tmpArr: TArr_int;
begin
  n := 10001;
  SetLength(arr, n);

  for i := 0 to n - 1 do
    arr[i] := i + 1;

  // 最后一个数，是随机数
  Randomize;
  arr[high(arr)] := Random(n) + 1;
  index := Random(n); // 随机下标

  TUtils_Int.Swap(arr[index], arr[high(arr)]);

  for i := 0 to high(arr) do
    write(arr[i], ' ');
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
    Inc(tmpArr[arr[i]]);

  for i := 0 to high(tmpArr) do
    write(tmpArr[i], ' ');
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
