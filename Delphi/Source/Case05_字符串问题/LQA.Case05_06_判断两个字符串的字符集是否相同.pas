unit LQA.Case05_06_判断两个字符串的字符集是否相同;

{ **
  * 询问两个串是否由相同的字符集生成
  * }

interface

uses
  System.SysUtils,
  LQA.Utils;

procedure Main;

implementation

function Check(s1, s2: UString): boolean;
var
  aux: TArr_int;
  i: integer;
begin
  SetLength(aux, 128);

  for i := 0 to s1.Length - 1 do
  begin
    if aux[Ord(s1.Chars[i])] = 0 then
      aux[Ord(s1.Chars[i])] := 1;
  end;

  for i := 0 to s2.Length - 1 do
  begin
    if aux[Ord(s2.Chars[i])] = 0 then

    begin
      Result := False;
      Exit;
    end;
  end;

  Result := True;
end;

procedure Main;
begin
  WriteLn(Check('abcde', 'deabccadcd'));
end;

end.
