unit LQA.Case02_03_RotateTheMinimumNumberOfTheArray;

{**
 * 旋转数组的最小数字：把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。
 * 输入一个递增排序的数组的一个旋转，输出旋转数组的最小元素。
 * 例如数组 [3,4,5,1,2] 为 [1,2,3,4,5] 的一个旋转，
 * 该数组的最小值为1.
 *
 * 重点：活用二分查找
 *}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

function Min(arr: TArr_int): integer;
var
  l, r, mid: integer;
begin
  l := 0;
  r := High(arr) - 1;
  //考虑没有旋转这种特殊的旋转
  if arr[l] < arr[r] then
  begin
    Result := arr[l];
    Exit;
  end;

  // l 和 r 指向相邻元素，退出
  while (l + 1 < r) do
  begin
    mid := l + (r - l) div 2;

    //  要么左侧有序，要么右侧有序
    if arr[mid] >= arr[l] then//左侧有序
      l := mid
    else
      r := mid;
  end;

  Result := arr[r];
end;

procedure Main;
var
  arr: TArr_int;
  res: integer;
begin
  arr := [5, 1, 2, 3, 4];
  res := min(arr);
  WriteLn(res = 1);
  DrawLineBlockEnd;

  arr := [2, 3, 4, 5, 6];
  res := min(arr);
  WriteLn(res = 2);
  DrawLineBlockEnd;

  arr := [1, 0, 1, 1, 1];
  res := min(arr);
  WriteLn(res = 0);
end;

end.
