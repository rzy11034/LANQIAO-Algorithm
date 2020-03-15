unit LQA.Case05_03_CheckSame;

{*
  变形词:两个串有相同的字符及数量组成 abc abc ,abc cba,aabcd bcada;
  给定两个字符串，请编写程序，确定其中一个字符串的字符重新排列后，能否变成另一个字符串。
   * 这里规定大小写为不同字符，且考虑字符串中的空格。
  给定一个string stringA和一个string stringB，请返回一个bool，代表两串是否重新排列后可相同。
  保证两串的长度都小于等于5000。
  测试样例：
  "Here you are","Are you here"
  返回：false
}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

// Olg(n)
function CheckSame(s1, s2: UString): boolean;
var
  chrs1, chrs2: TArr_chr;
  tmp1, tmp2: UString;
  i: integer;
begin
  if s1.Length <> s2.Length then
  begin Exit(False); end;

  tmp1 := '';
  tmp2 := '';

  chrs1 := s1.ToCharArray;
  chrs2 := s2.ToCharArray;

  TArrayUtils_chr.Sort(chrs1);
  TArrayUtils_chr.Sort(chrs2);

  for i := 0 to High(chrs1) do
  begin
    tmp1 += chrs1[i];
  end;
  for i := 0 to High(chrs2) do
  begin
    tmp2 += chrs1[i];
  end;

  Result := tmp1 = tmp2;
end;

function CheckSameADV(s1, s2: UString): boolean;
var
  aux: TArr_int;
  i: integer;
begin
  SetLength(aux, 128);

  for i := 0 to s1.Length - 1 do
    aux[Ord(s1.Chars[i])] += 1;

  for i := 0 to s2.Length - 1 do
  begin
    if aux[Ord(s2.Chars[i])] > 0 then
    begin
      aux[Ord(s2.Chars[i])] -= 1;
    end
    else
    begin
      Result := False;
      Exit;
    end;
  end;

  for i := 0 to High(aux) do
  begin
    if aux[i] > 0 then
    begin
      Result := False;
      Exit;
    end;
  end;

  Result := True;
end;

procedure Main;
var
  s1, s2: UString;
begin
  s1 := 'aabcd';
  s2 := 'bcada';
  WriteLn(CheckSame(s1, s2));
  DrawLineBlockEnd;

  WriteLn(CheckSameADV(s1, s2));
end;

end.