unit LQA.Case03_04_最小可用ID;

{ **
  * 解决最小可用id问题： 在非负数组（乱序）中找到最小的可分配的id（从1开始编号）
  * }

interface

uses
  System.SysUtils,
  LQA.Utils;

procedure Main;

implementation

//  O(N²) 暴力解法:从1开始依次探测每个自然数是否在数组中
function Find1(arr: TArr_int): integer;
var
  i, ret: integer;
begin
  i := 1;

  while True do
  begin
    if TArrayUtils_int.indexOf(arr, i) = -1 then
    begin
      ret := i;
      Break;
    end;

    Inc(i);
  end;

  Result := ret;
end;

//  NlogN
function Find2(arr: TArr_int): integer;
var
  i: integer;
begin
  TArrayUtils_int.Sort(arr); // NlogN
  i := 0;
  while i < high(arr) do
  begin
    if i + 1 <> arr[i] then //不在位的最小的自然数
    begin
      Result := i + 1;
      Exit;
    end;

    Inc(i);
  end;
  Result := i + 1;
end;

// 改进 1：
// 用辅助数组
function Find3(arr: TArr_int): integer;
var
  n, i: integer;
  helper: TArr_int;
begin
  n := Length(arr);
  SetLength(helper, n + 1);

  for i := 0 to n - 1 do
  begin
    if arr[i] < n + 1 then
      helper[arr[i]] := 1;
  end;

  for i := 1 to n do
  begin

    if helper[i] = 0 then
    begin
      Result := i;
      Exit;
    end;
  end;

  Result := n + 1;
end;

{ **
  * 改进2，分区，递归
  * 问题可转化为：n个正数的数组A，如果存在小于n的数不在数组中，
  * 必然存在大于n的数在数组中， 否则数组排列恰好为1到n
  * @param arr
  * @param l
  * @param r
  * @return
  * }
function Find4(arr: TArr_int; l, r: integer): integer;
// 双路 Partition
  function __partition(var arr: TArr_int; l, r: integer): integer;
  var
    i, j, e: integer;
  begin
    TUtils_int.Swap(arr[l], arr[l + (r - l) div 2]);
    e := arr[l];

    i := l + 1;
    j := r;
    while True do
    begin
      while (i <= r) and (arr[i] < e) do
        Inc(i);
      while (j >= l + 1) and (arr[j] > e) do
        Dec(j);

      if i > j then
        Break;

      TUtils_int.Swap(arr[i], arr[j]);
      Inc(i);
      Dec(j);
    end;

    TUtils_int.Swap(arr[l], arr[j]);
    Result := j;
  end;

//**
// * 期望O(n)，最差O(n²)
// *
// * arr: 数组
// * p: 开始下标
// * r: 结束小标
// * k: 求第k小元素（递增第k个元素）
// *
  function __selectK(var arr: TArr_int; p, r, k: integer): integer;
  var
    q, qk, ret: integer;
  begin
    q := __partition(arr, p, r);
    qk := q - p + 1;

    if qk = k then
      ret := arr[q]
    else
      if qk > k then
      ret := __selectK(arr, p, q - 1, k)
    else
      ret := __selectK(arr, q + 1, r, k - qk);

    Result := ret;
  end;

var
  midIndex, q, t, ret: integer;
begin
  if l > r then
  begin
    Result := l + 1;
    Exit;
  end;

  midIndex := l + (r - l) div 2; // 中间下标
  q := __selectK(arr, l, r, midIndex - l + 1);
  t := midIndex + 1;

  if q = t then
    ret := Find4(arr, midIndex + 1, r)
  else
    ret := Find4(arr, l, midIndex - 1);

  Result := ret;
end;

procedure Main;
var
  arr: TArr_int;
begin
  arr := [1, 2, 3, 4, 5, 8, 9, 10, 11, 10000];
  WriteLn(Find1(arr));
  DrawLineBlockEnd;

  arr := [1, 2, 3, 4, 5, 8, 9, 10, 11, 10000];
  WriteLn(Find2(arr));
  DrawLineBlockEnd;

  arr := [1, 2, 3, 4, 5, 8, 9, 10, 11, 10000];
  WriteLn(Find3(arr));
  DrawLineBlockEnd;

  arr := [1, 2, 3, 4, 5, 8, 9, 10, 11, 10000];
  WriteLn(Find4(arr, 0, high(arr)));
end;

end.
