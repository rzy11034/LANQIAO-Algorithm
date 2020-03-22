unit LQA.Case08_06_LexicographicalMinimumProblem;

(*
字典序最小问题

给一个定长为N的字符串S,构造一个字符串T,长度也为N。

起初，T是一个空串，随后反复进行下列任意操作

1. 从S的头部删除一个字符，加到T的尾部
2. 从S的尾部删除一个字符，加到T的尾部

目标是最后生成的字符串T的字典序尽可能小

1≤N≤2000
字符串S只包含大写英文字母

输入：字符串S
输出：字符串T

 *)

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

type
  TLexicographicalMinimumProblem = class(TObject)
  public
    function Solution(s: UString): UString;
  end;

procedure Main;

implementation

procedure Main;
begin
  with TLexicographicalMinimumProblem.Create do
  begin
    WriteLn(Solution('ASDFGHJK'));
  end;
end;

{ TLexicographicalMinimumProblem }

function TLexicographicalMinimumProblem.Solution(s: UString): UString;
var
  s1: UString;
  k: integer;
  sb: TStringBuilder;
begin
  s1 := s.ReverseString;
  sb := TStringBuilder.Create;

  for k := 0 to s.Length - 1 do
  begin
    if s <= s1 then
    begin
      sb.Append(s.Chars[0]);
      s := s.Substring(1, s.Length - 1);
    end
    else
    begin
      sb.Append(s1.Chars[0]);
      s1 := s1.Substring(1, s.Length - 1);
    end;
  end;

  Result := sb.ToString;
end;

end.
