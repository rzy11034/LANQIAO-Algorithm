unit LQA.Case03_02_第K个元素;
{ **
  * 求顺序统计位的元素，如第一小元素，最大元素，第二小元素，
  * 或在顺序统计中任意位置的数
  *
  * }

interface

uses
  LQA.Utils;

procedure Main;

implementation

// 双路 Partition
function Partition(var arr: TArr_int; l, r: integer): integer;
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
function SelectK(var arr: TArr_int; p, r, k: integer): integer;
var
  q, qk, ret: integer;
begin
  q := Partition(arr, p, r);
  qk := q - p + 1;

  if qk = k then
    ret := arr[q]
  else if qk > k then
    ret := SelectK(arr, p, q - 1, k)
  else
    ret := SelectK(arr, q + 1, r, k - qk);

  Result := ret;
end;

procedure Main;
var
  arr: TArr_int;
  k: integer;
begin
  arr := [3, 9, 7, 6, 1, 2];
  k := SelectK(arr, 0, Length(arr) - 1, 2);
  WriteLn(k);
  DrawLineBlockEnd;

  k := SelectK(arr, 0, Length(arr) - 1, 1);
  WriteLn(k);
  DrawLineBlockEnd;

  k := SelectK(arr, 0, Length(arr) - 1, 3);
  WriteLn(k);
  DrawLineBlockEnd;

  k := SelectK(arr, 0, Length(arr) - 1, 6);
  WriteLn(k);
  DrawLineBlockEnd;
end;

end.
