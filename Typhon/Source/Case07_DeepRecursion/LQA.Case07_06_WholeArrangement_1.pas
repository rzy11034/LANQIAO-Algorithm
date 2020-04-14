unit LQA.Case07_06_WholeArrangement_1;

{**
 * 编写一个方法，确定某字符串的所有排列组合。

 给定一个string A和一个int n,代表字符串和其长度，请返回所有该字符串字符的排列，
 保证字符串长度小于等于11且字符串中字符均为大写英文字符，

 *}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

// 逐步生成----迭代法
function Solution1(const str: UString): TList_str;
var
  res, tmpList: TList_str;
  s, tmpStr: UString;
  c: UChar;
  i, j: integer;
begin
  res := TList_str.Create;
  res.AddLast(str.Chars[0]);

  for i := 1 to str.Length - 1 do
  begin
    tmpList := TList_str.Create;
    c := str.Chars[i];

    for s in res.ToArray do
    begin
      // 加到左边
      tmpList.AddLast(c + s);
      // 加到右边
      tmpList.AddLast(s + c);
      // 加到中间
      for j := 1 to s.Length - 1 do
      begin
        tmpStr := s.Substring(0, j) + c + s.Substring(j, s.Length);
        tmpList.AddLast(tmpStr);
      end;
    end;

    res := tmpList;
  end;

  Result := res;
end;

// 逐步生成----递归法
function Solution2(const str: UString): TList_str;
  function __solution2(const str: UString; cur: integer): TList_str;
  var
    res, tmpList: TList_str;
    s, tmpStr: UString;
    j: integer;
    c: UChar;
  begin
    res := TList_str.Create;

    if cur = 0 then
    begin
      res.AddLast(str.Chars[cur]);
      Exit(res);
    end;

    tmpList := __solution2(str, cur - 1);
    for s in tmpList.ToArray do
    begin
      //tmpList := TList_str.Create;
      c := str.Chars[cur];

      // 加到左边
      res.AddLast(c + s);
      // 加到右边
      res.AddLast(s + c);
      // 加到中间
      for j := 1 to s.Length - 1 do
      begin
        tmpStr := s.Substring(0, j) + c + s.Substring(j, s.Length);
        res.AddLast(tmpStr);
      end;
    end;

    Result := res;
  end;

begin
  Result := __solution2(str, str.Length - 1);
end;

procedure Main;
var
  s: UString;
  tmp: TList_str;
begin
  s := 'ABCDEFGHIJK';
  tmp := Solution1(s);
  TArrayUtils_str.Print(tmp.ToArray);

  DrawLineBlockEnd;

  tmp := Solution2(s);
  TArrayUtils_str.Print(tmp.ToArray);
end;

end.