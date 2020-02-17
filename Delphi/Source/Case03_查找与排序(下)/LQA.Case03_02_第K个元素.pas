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
function Partition(arr: TArr_int; l, r: integer): integer;
var
  i, j, e: integer;
begin
  TUtils_Int.Swap(arr[l], arr[l + (r - l) div 2]);
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

    TUtils_Int.Swap(arr[i], arr[j]);
    Inc(i);
    Dec(j);
  end;

  TUtils_Int.Swap(arr[l], arr[j]);
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
function SelectK(arr: TArr_int; p, r, k: integer): integer;
var
  pv: integer;
begin
  pv := Partition(arr, p, r);

  SelectK(arr, p, pv - 1, 0);
  SelectK(arr, pv + 1, r, 0);
end;

procedure Main;
var
  arr: TArr_int;
begin
  arr := [9, 8, 7, 6, 5];
  SelectK(arr, 0, Length(arr) - 1, 0);
  TUtils_Int.PrintArray(arr);
end;

end.
