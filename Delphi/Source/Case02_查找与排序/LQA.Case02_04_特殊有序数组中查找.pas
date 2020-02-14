unit LQA.Case02_04_特殊有序数组中查找;

{ **
  * 有个排序后的字符串数组，其中散布着一些空字符串，编写一个方法，
  * 找出给定字符串（肯定不是空字符串）的索引。
  * * }

interface

uses
  System.SysUtils,
  LQA.Utils;

procedure Main;

implementation

function IndexOf(arr: TArr_str; s: UString): integer;
var
  l, r, mid: integer;
begin
  l := 0;
  r := Length(arr) - 1;

  while l <= r do
  begin
    mid := l + (r - l) div 2;

    while arr[mid] = '' do
    begin
      Inc(mid);

      // 千万要注意
      if (mid > r) then
      begin
        Result := -1;
        Exit;
      end;
    end;

    if arr[mid] > s then
      r := mid - 1
    else if arr[mid] < s then
      l := mid + 1
    else
    begin
      Result := mid;
      Exit;
    end;
  end;

  Result := -1;
end;

procedure Main;
var
  arr: TArr_str;
  res: integer;
begin
  arr := ['a', '', 'ac', '', 'ad', 'b', '', 'ba'];
  res := IndexOf(arr, 'ad');
  WriteLn(res);
end;

end.
