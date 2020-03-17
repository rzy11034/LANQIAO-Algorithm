unit LQA.Case07_04_LegalBracketCombination;

{**
 * 1.输出合法的括号组合
 * 输入括号对数
 * 输出所有合法组合
 * 输入:3
 * 输出:()()(),((())),(()()),()(()),(())(),
 * 2.判断一个字符串是否合法
 *}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

// 逐步生成之递归解法
function LegalBracketCombination1(n: integer): TSet_str;
var
  ret, tmp: TSet_str;
  s: UString;
begin
  ret := TSet_str.Create;

  if n = 1 then
  begin
    ret.Add('()');
    Exit(ret);
  end;

  tmp := LegalBracketCombination1(n - 1);
  for s in tmp.ToArray do
  begin
    ret.Add('()' + s);
    ret.Add(s + '()');
    ret.Add('(' + s + ')');
  end;

  Result := ret;
end;

// 迭代形式
function LegalBracketCombination2(n: integer): TSet_str;
var
  ret, tmp: TSet_str;
  s: UString;
  i: integer;
begin
  ret := TSet_str.Create;
  ret.Add('()');

  if n = 1 then
    Exit(ret);

  for i := 2 to n do
  begin
    tmp := TSet_str.Create;

    for s in ret.ToArray do
    begin
      tmp.Add('()' + s);
      tmp.Add(s + '()');
      tmp.Add('(' + s + ')');
    end;

    ret := tmp;
  end;

  Result := ret;
end;

procedure Main;
var
  s: UString;
  n: integer;
begin
  n := 4;

  for s in LegalBracketCombination1(n).ToArray do
    Write(s, ' ');
  WriteLn;

  for s in LegalBracketCombination2(n).ToArray do
    Write(s, ' ');
  WriteLn;
end;

end.
