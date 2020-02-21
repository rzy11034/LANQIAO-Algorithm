unit LQA.Case03_06_InversePairs;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

// 顺序查找（暴力查找） O(n**2)
function InversePairs1(arr: TArr_int): integer;
var
  ret, i, j: integer;
begin
  ret := 0;

  for i := 0 to High(arr) do
  begin
    for j := i + 1 to High(arr) do
    begin
      if arr[i] > arr[j] then
        Inc(ret);
    end;
  end;

  Result := ret;
end;

// 利用归并排序算法求逆序对
function InversePairs2(arr: TArr_int): integer;
var
  countInverse: integer;

  procedure __merge(var arr: TArr_int; l, mid, r: integer);
  var
    aux: TArr_int;
    leftPoint, rightPoint, i: integer;
  begin
    SetLength(aux, r - l + 1);
    for i := l to r do
      aux[i - l] := arr[i];

    //辅助数组的两个指针
    leftPoint := l;
    rightPoint := mid + 1;

    for i := l to r do
    begin
      if leftPoint > mid then // 左下标到头
      begin
        arr[i] := aux[rightPoint - l];
        Inc(rightPoint);
      end
      else if rightPoint > r then  // 右下标到头
      begin
        arr[i] := aux[leftPoint - l];
        Inc(leftPoint);
      end
      else if aux[leftPoint - l] > aux[rightPoint - l] then // 左比右大
      begin
        arr[i] := aux[rightPoint - l];
        countInverse := countInverse + (mid - l + 1);
        Inc(rightPoint);
      end
      else // 右比左大
      begin
        arr[i] := aux[leftPoint - l];
        Inc(leftPoint);
      end;
    end;
  end;

  procedure __sort(var arr: TArr_int; l, r: integer);
  var
    mid: integer;
  begin
    if l >= r then
      Exit;

    mid := l + (r - l) div 2;
    __sort(arr, l, mid);
    __sort(arr, mid + 1, r);
    __merge(arr, l, mid, r);
  end;

begin
  countInverse := 0;
  __sort(arr, 0, High(arr));
  Result := countInverse;
end;

procedure Main;
var
  arr: TArr_int;
begin
  arr := [9, 8, 7, 6, 5, 4, 3, 2, 1];
  WriteLn(InversePairs1(arr));
  DrawLineBlockEnd;

  WriteLn(InversePairs2(arr));
  TArrayUtils_int.Print(arr);
end;

end.