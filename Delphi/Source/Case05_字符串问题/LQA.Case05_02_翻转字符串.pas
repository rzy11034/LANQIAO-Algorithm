unit LQA.Case05_02_翻转字符串;

{ *
  请实现一个算法，翻转一个给定的字符串.
  测试样例：
  "This is nowcoder"
  返回："redocwon si sihT"
}

interface

uses
  System.SysUtils,
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
    tmp := tmp + s.Chars[i];
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
