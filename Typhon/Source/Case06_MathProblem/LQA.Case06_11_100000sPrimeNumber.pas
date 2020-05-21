unit LQA.Case06_11_100000sPrimeNumber;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

// 求第N个素数 ===》 埃氏筛法
procedure ErichsenSieveMethod(n: integer);
var
  len, x, k, sum, i: integer;
  arr: TArr_int;
begin
  // N 是第 N 个素数
  // 已知在整数X内大概有 X/log(X) 个素数
  // 现在我们要逆推：要想求第N个素数，我们的整数范围是什么
  // len 就是整数范围
  len := 2;
  while (len / Ln(len) < n) do
  begin
    Inc(len);
  end;

  // 开辟一个数组，下标是自然数，值是标记
  // 基本思路是筛选法，把非素数标记出来
  SetLength(arr, len);
  x := 2;
  while (x < len) do
  begin
    //标记过了，继续下一个
    if arr[x] <> 0 then
    begin
      Inc(x);
      Continue;
    end;

    k := 2;
    //对每个x，我们从2倍开始，对x的k倍，全部标记为-1
    while x * k < len do
    begin
      arr[x * k] := -1;
      Inc(k);
    end;

    Inc(x);
  end;

  // 筛完之后，这个很长的数组里面非素数下标对应的值都是 -1
  sum := 0;
  for i := 2 to Length(arr) - 1 do
  begin
    //是素数，计数+1
    if arr[i] = 0 then
    begin
      Inc(sum);
    end;

    if sum = n then
    begin
      WriteLn(i);
      Exit;
    end;
  end;
end;

// 测试num是否素数
function IsPrime(num: integer): boolean;
var
  i: integer;
begin
  i := 2;
  while i * i <= num do
  begin
    if num mod i = 0 then
      Exit(false);

    Inc(i);
  end;

  Result := true;
end;

procedure Main;
var
  beginTime, endTime: cardinal;
  cnt, x: integer;
begin
  beginTime := TThread.GetTickCount64;
  ErichsenSieveMethod(100002);;
  endTime := TThread.GetTickCount64;
  Writeln('Total Time : ', ((endTime - beginTime) / 1000).ToString, ' s');

  DrawLineBlockEnd;

  beginTime := TThread.GetTickCount64;
  cnt := 0;
  x := 2;
  while (cnt < 100002) do
  begin
    if IsPrime(x) then
      Inc(cnt);
    Inc(x);
  end;
  endTime := TThread.GetTickCount64;
  WriteLn(x - 1);
  Writeln('Total Time : ', ((endTime - beginTime) / 1000).ToString, ' s');
end;

end.
