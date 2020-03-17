unit LQA.Case02_05_LongestContinuousIncreasingSubsequence;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

function LongestSubsequence(arr: TArr_int): TArr_int;
var
  ret: TArr_int;
  longest, lowIndex, len, i, j: integer;
begin
  longest := 0;
  lowIndex := 0;
  len := 1;

  // 定位最长连续递增子序列的下标和长度
  i := 0;
  while i < High(arr) do
  begin
    len := 1;

    for j := i to High(arr) do
    begin
      if (j + 1 <= High(arr)) and (arr[j] < arr[j + 1]) then
        Inc(len)
      else
      begin
        if len > longest then
        begin
          longest := len;
          lowIndex := i;
        end;

        i := j + 1;
        Break;
      end;
    end;
  end;

  // 生成最长连续递增子序列并返回
  if longest > 1 then
  begin
    SetLength(ret, longest);

    for i := 0 to longest - 1 do
      ret[i] := arr[lowIndex + i];

    Result := ret;
    Exit;
  end;

  Result := nil;
end;

procedure Main;
var
  arr: TArr_int;
begin
  arr := [1, 9, 2, 5, 7, 3, 4, 6, 8, 0];
  TArrayUtils_int.Print(LongestSubsequence(arr));
end;

end.
