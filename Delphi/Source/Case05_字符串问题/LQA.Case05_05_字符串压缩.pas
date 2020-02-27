unit LQA.Case05_05_字符串压缩;

{ **
  利用字符重复出现的次数，编写一个方法，实现基本的字符串压缩功能。
  比如，字符串“aabcccccaaa”经压缩会变成“a2b1c5a3”。
  若压缩后的字符串没有变短，则返回原先的字符串。
  给定一个string iniString为待压缩的串(长度小于等于10000)，
  保证串内字符均由大小写英文字母组成，返回一个string，为所求的压缩后或未变化的串。
  测试样例
  "aabcccccaaa"
  返回："a2b1c5a3"
  * }

interface

uses
  System.SysUtils,
  LQA.Utils;

procedure Main;

implementation

function StringZipper(s: UString): UString;
var
  sb: TStringBuilder;
  last, Count, i: integer;
  ret: UString;
begin
  sb := TStringBuilder.Create;
  try
    last := 0;
    Count := 1;

    i := 1;
    while i < s.Length do
    begin
      if s.Chars[i - 1] <> s.Chars[i] then
      begin
        sb.Append(s.Chars[last]).Append(Count);
        last := i;
        Count := 1;
      end
      else
      begin
       Inc( Count , 1);
      end;

      if i + 1 = s.Length then
      begin
        sb.Append(s.Chars[last]).Append(Count);
        Break;
      end;

      inc(i,1);
    end;

    if s.Length = sb.Length then
      ret := s
    else
      ret := sb.ToString;

    Result := ret;
  finally
    sb.Free;
  end;
end;

procedure Main;
var
  s: UString;
begin
  s := 'aabcccccaaa';
  WriteLn(StringZipper(s));
end;

end.
