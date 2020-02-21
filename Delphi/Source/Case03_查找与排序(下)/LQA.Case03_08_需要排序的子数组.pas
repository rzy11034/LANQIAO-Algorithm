unit LQA.Case03_08_需要排序的子数组;

interface

uses
  LQA.Utils;

procedure Main;

implementation

function FindSegment(arr: TArr_int; out ret: TArr_int): integer;
var
  l, r, min, max, len, i: integer;
begin
  len := Length(arr);
  l := -1;
  r := -1;
  min := arr[0];
  max := arr[len - 1];

  // 拓展右端点：更新历史最高，只要右侧出现比历史最高低的，就应该将右边界扩展到此处
  for i := 0 to len - 1 do
  begin
    if arr[i] > max then
      max := arr[i];

    //只要低于历史高峰，就要扩展需排序区间的右端点
    if arr[i] < max then
      r := i;
  end;

  // 找左端点：更新历史最低，只要左侧出现比历史最低高的，就应该将左边界扩展到此处
  for i := len - 1 downto 0 do
  begin
    if arr[i] < min then
      min := arr[i];

    if arr[i] > min then
      l := i;
  end;

  if l = -1 then
    ret := [0, 0];

  ret := [l, r];
  Result := r - l + 1;
end;

procedure Main;
var
  arr, ret: TArr_int;
begin
  arr := [1, 4, 6, 5, 9, 10];
  WriteLn(FindSegment(arr, ret));
  TArrayUtils_int.print(ret);
  DrawLineBlockEnd;

  arr := [1, 2, 3, 4, 5, 6];
  WriteLn(FindSegment(arr, ret));
  TArrayUtils_int.print(ret);
  DrawLineBlockEnd;

  arr := [1, 5, 3, 4, 2, 6, 7];
  WriteLn(FindSegment(arr, ret));
  TArrayUtils_int.print(ret);
  DrawLineBlockEnd;

  arr := [2, 3, 7, 5, 4, 6];
  WriteLn(FindSegment(arr, ret));
  TArrayUtils_int.print(ret);
  DrawLineBlockEnd;

  arr := [3, 2, 5, 6, 7, 8];
  WriteLn(FindSegment(arr, ret));
  TArrayUtils_int.print(ret);
  DrawLineBlockEnd;

  arr := [2, 8, 7, 10, 9];
  WriteLn(FindSegment(arr, ret));
  TArrayUtils_int.print(ret);
  DrawLineBlockEnd;

  arr := [2, 3, 7, 4, 1, 5, 6];
  WriteLn(FindSegment(arr, ret));
  TArrayUtils_int.print(ret);
  DrawLineBlockEnd;
end;

end.
