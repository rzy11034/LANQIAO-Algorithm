unit LQA.Case05_02_ReverseString;

{*
  请实现一个算法，翻转一个给定的字符串.
  测试样例：
  "This is nowcoder"
  返回："redocwon si sihT"
}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

procedure ReverseString(var s: UString);
var
  tmp: UString;
  i: integer;
begin
  tmp := '';

  for i := s.Length - 1 downto 0 do
  begin
    tmp += s.Chars[i];
  end;

  s := tmp;
end;

procedure Main;
var
  s: UString;
begin
  s := 'This is nowcoder';
  ReverseString(s);
  WriteLn(s);
end;

end.