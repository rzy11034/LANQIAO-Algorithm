unit LQA.Case03_12_ContainsAll;

{**
 * Case02串B是否包含串A的全部字符：
 * 判断字符串A中的字符是否全部出现在字符串B中（大众点评笔试题）
 * *}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

function Check(strA, strB: UString): boolean;
var
  arr_strB: TUnicodeCharArray;
  ret, i: integer;
begin
  arr_strB := strB.ToCharArray;
  TArrayUtils_chr.Sort(arr_strB);

  for i := 0 to Length(strA) - 1 do
  begin
    ret := TArrayUtils_chr.BinarySearch(arr_strB, strA.Chars[i]);

    if ret = -1 then
    begin
      Result := false;
      Exit;
    end;
  end;

  Result := true;
end;

procedure Main;
var
  strA, strB: UString;
begin
  strA := 'bcd';
  strB := 'xyabcd';

  WriteLn(Check(strA, strB));
end;

end.
