unit LQA.Case05_08_WordReverse;

{*
* 将字符串按单词翻转,如 here you are 翻转成 are you here
*}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

function WordReverse(src: UString): UString;
var
  s: UString;
  wordArr: TArr_str;
  i: integer;
  sb: TStringBuilder;
begin
  s := src.ReverseString;

  wordArr := s.Split([' ']);

  sb := TStringBuilder.Create;
  try
    for i := 0 to High(wordArr) do
    begin
      sb.Append(wordArr[i].ReverseString);

      if i <> High(wordArr) then
        sb.Append(' ');
    end;

    Result := sb.ToString;
  finally
    sb.Free;
  end;
end;

procedure Main;
var
  s1, s2: UString;
begin
  s1 := 'here you are';
  s2 := WordReverse(s1);
  WriteLn(s2);
end;

end.
