unit LQA.Case03_12_字符串的包含;

{**
 * Case02串B是否包含串A的全部字符：
 * 判断字符串A中的字符是否全部出现在字符串B中（大众点评笔试题）
 * *}

interface

uses
  System.SysUtils,
  LQA.Utils;

procedure Main;

implementation

function Check(strA, strB: UString): boolean;
var
  arr_strB: TArr_chr;
  ret, i: integer;
begin
  arr_strB := strB.ToUnicodeCharArray;
  TArrayUtils_chr.Sort(arr_strB);

  for i := 0 to Length(strA) - 1 do
  begin
    ret := TArrayUtils_chr.BinarySearch(arr_strB, strA.Chars[i]);

    if ret = -1 then
    begin
      Result := False;
      Exit;
    end;
  end;

  Result := True;
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
